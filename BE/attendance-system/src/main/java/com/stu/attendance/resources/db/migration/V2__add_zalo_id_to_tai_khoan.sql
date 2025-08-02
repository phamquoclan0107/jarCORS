-- Add zalo_id column to tai_khoan table
ALTER TABLE tai_khoan ADD COLUMN zalo_id VARCHAR(255);

-- Create index for better performance
CREATE INDEX idx_tai_khoan_zalo_id ON tai_khoan(zalo_id);

-- Add unique constraint to ensure one Zalo ID per account
ALTER TABLE tai_khoan ADD CONSTRAINT uk_tai_khoan_zalo_id UNIQUE (zalo_id); 