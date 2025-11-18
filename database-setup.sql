-- BookHub Database Setup Script for PostgreSQL (Aiven)
-- This script creates the database and table structure for the BookHub application
-- Note: Hibernate will automatically create the table if hibernate.hbm2ddl.auto=update
-- This script is provided for manual setup if needed

-- Note: For Aiven PostgreSQL, the database is usually pre-created (e.g., defaultdb)
-- You may need to create a new database if required:
-- CREATE DATABASE bookhub_db;

-- Connect to your database (replace with your database name)
-- \c bookhub_db;

-- Create books table
-- This matches the Book entity structure
CREATE TABLE IF NOT EXISTS books (
    book_id BIGSERIAL NOT NULL,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL,
    price DOUBLE PRECISION NOT NULL,
    PRIMARY KEY (book_id)
);

-- Optional: Insert sample data for testing
-- Uncomment the following lines if you want to start with sample books

-- INSERT INTO books (title, author, price) VALUES
-- ('The Great Gatsby', 'F. Scott Fitzgerald', 12.99),
-- ('To Kill a Mockingbird', 'Harper Lee', 14.99),
-- ('1984', 'George Orwell', 13.99),
-- ('Pride and Prejudice', 'Jane Austen', 11.99),
-- ('The Catcher in the Rye', 'J.D. Salinger', 10.99);

-- Verify table creation
SELECT tablename FROM pg_tables WHERE schemaname = 'public';

-- Show table structure
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_name = 'books';

-- Show current records (will be empty if no sample data inserted)
SELECT * FROM books;

-- Script completed successfully
SELECT 'BookHub database setup completed!' AS Status;
