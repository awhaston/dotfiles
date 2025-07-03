#!/usr/bin/env python3
"""
OfflineIMAP helper functions for macOS Keychain integration
"""
import subprocess
import sys

def get_keychain_pass(service, account):
    """Retrieve password from macOS Keychain"""
    try:
        cmd = [
            'security', 
            'find-generic-password',
            '-s', service,
            '-a', account,
            '-w'  # Return only the password
        ]
        
        result = subprocess.run(
            cmd, 
            capture_output=True, 
            text=True, 
            check=True
        )
        
        return result.stdout.strip()
        
    except subprocess.CalledProcessError as e:
        print(f"Error retrieving password from keychain: {e}", file=sys.stderr)
        print(f"Make sure you've stored the password with:", file=sys.stderr)
        print(f"security add-generic-password -s '{service}' -a '{account}' -w 'YOUR_PASSWORD'", file=sys.stderr)
        raise

def get_output(cmd):
    """Execute shell command and return output"""
    try:
        result = subprocess.run(
            cmd.split(), 
            capture_output=True, 
            text=True, 
            check=True
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        print(f"Command failed: {cmd}", file=sys.stderr)
        print(f"Error: {e}", file=sys.stderr)
        raise
