USE CMS;

--------------------------------------------------------------------------------------------------------------------------------
-- Trigger to update the lease end date for tenant residents based on the start date of the lease
GO
CREATE TRIGGER trg_UpdateLeaseEndDate
ON Apartment
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE a
    SET a.LeaseEndDate = DATEADD(YEAR, 1, i.LeaseStartDate)
    FROM Apartment a
    JOIN inserted i ON a.ApartmentID = i.ApartmentID
    JOIN Resident r ON a.ApartmentID = r.ApartmentID
    WHERE r.OccupancyType = 'Tenant' AND i.LeaseStartDate IS NOT NULL;
END;
GO
--------------------------------------------------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------------------------------------------------
-- Trigger to update service request if the scheduled date and/or priority is updated
GO
CREATE TRIGGER trg_UpdateServiceRequest
ON ServiceRequest
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF UPDATE(ScheduledDate)
    BEGIN
        DECLARE @RequestType VARCHAR(50);
        DECLARE @ServiceRequestID INT;
        DECLARE @CurrentStaffAssignedID INT;
        DECLARE @RoleRequired VARCHAR(50);

        DECLARE @UpdatedScheduledDate DATE;
        DECLARE @UpdatedStaffAssignedID INT;

        SELECT TOP 1
            @ServiceRequestID = i.ServiceRequestID,
            @RequestType = i.RequestType,
            @UpdatedScheduledDate = i.ScheduledDate,
            @CurrentStaffAssignedID = i.StaffAssignedID
        FROM Inserted i;
        
        SET @RoleRequired = 
        CASE 
            WHEN @RequestType = 'Car Parking' THEN 'ParkingCoordinator'
            WHEN @RequestType = 'Common Area' THEN 'Facilitator'
            WHEN @RequestType = 'Electrical' THEN 'Electrician'
            WHEN @RequestType = 'Plumbing' THEN 'Plumber'
            WHEN @RequestType = 'Other' THEN 'GeneralMaintenance'
        END

        -- Find next available staff based on the updated date if the current staff is unavailable on the updated scheduled date
        IF NOT EXISTS (
            SELECT 1 
            FROM ServiceRequest sr 
            WHERE sr.StaffAssignedID = @CurrentStaffAssignedID AND sr.ScheduledDate = @UpdatedScheduledDate AND sr.ServiceRequestID != @ServiceRequestID
        )
        BEGIN    
            SELECT TOP 1 @UpdatedStaffAssignedID = s.StaffID
            FROM Staff s
            WHERE s.[Role] = @RoleRequired AND (s.EmploymentEndDate < GETDATE() OR s.EmploymentEndDate IS NULL)
            AND NOT EXISTS (
                SELECT 1
                FROM ServiceRequest sr
                WHERE sr.StaffAssignedID = s.StaffID AND sr.ScheduledDate = @UpdatedScheduledDate AND sr.ServiceRequestID != @ServiceRequestID
            )
            ORDER BY NEWID();

            UPDATE ServiceRequest
            SET StaffAssignedID = @UpdatedStaffAssignedID
            WHERE ServiceRequestID = @ServiceRequestID;
        END
    END
END;
GO
--------------------------------------------------------------------------------------------------------------------------------