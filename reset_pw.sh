#!/bin/bash
echo "Clearing password history for automation1@gmail.com"
podman exec $(podman ps -q --filter "ancestor=mcr.microsoft.com/mssql/server:2022-latest") /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P nopCommerce_db_v1 -C -Q "USE nopcommerce; DELETE FROM CustomerPassword WHERE CustomerId = 8"
echo "Done! Now go to admin and reset password to Password123!"
echo "http://localhost:8080/admin -> Customers -> automation1@gmail.com -> Change password"