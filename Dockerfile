# Use the official Rust image
FROM rust:1.77

# Set working directory
WORKDIR /app

# Copy everything
COPY . .

# Build the project
RUN cargo build --release

# Set the port (important for Render)
ENV PORT=3000

# Expose the port
EXPOSE 3000

# Run the binary
CMD ["./target/release/rahmanifx"]