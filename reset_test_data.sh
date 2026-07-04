#!/bin/bash
echo "=== Resetting test data ==="

DB_CMD="podman exec \$(podman ps -q --filter 'ancestor=mcr.microsoft.com/mssql/server:2022-latest') /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P nopCommerce_db_v1 -C"

# 1. Xóa password history
eval "$DB_CMD -Q \"USE nopcommerce;
DELETE FROM CustomerPassword
WHERE CustomerId != 8\""

# 2. Xóa addresses
echo "2. Clearing addresses..."
eval "$DB_CMD -Q \"USE nopcommerce; DELETE FROM Address WHERE Id IN (SELECT AddressId FROM CustomerAddresses WHERE CustomerId = 8)\""
eval "$DB_CMD -Q \"USE nopcommerce; DELETE FROM CustomerAddresses WHERE CustomerId = 8\""

# 3. Xóa wishlist
echo "3. Clearing wishlist..."
eval "$DB_CMD -Q \"USE nopcommerce; DELETE FROM ShoppingCartItem WHERE CustomerId = 8 AND ShoppingCartTypeId = 2\""

# 4. Xóa cart
echo "4. Clearing cart..."
eval "$DB_CMD -Q \"USE nopcommerce; DELETE FROM ShoppingCartItem WHERE CustomerId = 8 AND ShoppingCartTypeId = 1\""

# 5. Xóa product reviews
echo "5. Clearing product reviews..."
eval "$DB_CMD -Q \"USE nopcommerce; DELETE FROM ProductReview WHERE CustomerId = 8\""

# 6. Xóa customers đăng ký bởi automation test
echo "6. Clearing test registered accounts..."
eval "$DB_CMD -Q \"USE nopcommerce; DELETE FROM Customer WHERE Email LIKE '%faker%' OR Email LIKE 'automation_new%'\""

echo "=== Done! Now reset password via admin ==="
echo "localhost:8080/admin -> Customers -> automation1@gmail.com -> Password: 123456"
