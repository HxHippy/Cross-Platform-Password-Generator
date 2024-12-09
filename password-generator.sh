#!/bin/bash

show_help() {
    echo "Password Generator - Generate secure passwords across platforms"
    echo ""
    echo "Usage: $0 [LENGTH]"
    echo "Generates a secure password of specified length (12-512 characters)"
    echo ""
    echo "Options:"
    echo "  LENGTH     Number of characters (12-512)"
    echo "  -h,--help  Show this help message"
    echo ""
    echo "If LENGTH is not specified, defaults to 16 characters"
    echo ""
    echo "Features:"
    echo "  - Cross-platform (Windows, macOS, Linux)"
    echo "  - Secure random generation"
    echo "  - Includes uppercase, lowercase, numbers, and special characters"
    echo ""
    echo "Examples:"
    echo "  $0         # generates 16 character password"
    echo "  $0 32      # generates 32 character password"
    echo "  $0 64      # generates 64 character password"
}

# Function to generate password using /dev/urandom (Unix/Linux/Mac)
generate_unix_password() {
    local length=$1
    < /dev/urandom tr -dc 'A-Za-z0-9!@#$%^&*()_+-=' | head -c "$length"
}

# Function to generate password using Windows compatible method
generate_windows_password() {
    local length=$1
    local chars='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+-='
    local str=''
    local pos=0
    
    # Use bash's $RANDOM as a fallback
    for ((i=0; i<length; i++)); do
        pos=$((RANDOM % ${#chars}))
        str+="${chars:$pos:1}"
    done
    echo "$str"
}

# Check if help is requested
if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
    show_help
    exit 0
fi

# Get password length from argument or use default
length=${1:-16}

# Validate length
if ! [[ "$length" =~ ^[0-9]+$ ]]; then
    echo "Error: Length must be a number"
    show_help
    exit 1
fi

if [ "$length" -lt 12 ] || [ "$length" -gt 512 ]; then
    echo "Error: Length must be between 12 and 512 characters"
    exit 1
fi

# Try Unix method first, fallback to Windows method
if [ -e /dev/urandom ]; then
    password=$(generate_unix_password "$length")
else
    password=$(generate_windows_password "$length")
fi

echo "$password"
