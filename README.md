# 🔐 Projeto: Simulação de Ataques com Medusa e Kali Linux

Este projeto documenta a simulação de ataques de força bruta utilizando a ferramenta **Medusa** no Kali Linux, explorando ambientes vulneráveis como **Metasploitable 2** e **DVWA**. O objetivo é entender técnicas ofensivas e propor medidas defensivas para ambientes reais.

## 🧪 Ambiente de Testes

- **VirtualBox** com duas VMs:
  - **Kali Linux** (atacante)
  - **Metasploitable 2** (alvo)
- **Rede interna (host-only)** configurada para comunicação direta entre as VMs
- IPs fixos:
  - Kali: `192.168.56.102`
  - Metasploitable: `192.168.56.101`


## 🛠️ Ferramentas Utilizadas

- Kali Linux (2023.3)
- Medusa (ferramenta de força bruta)
- Python + Requests (para DVWA)
- Enum4linux (enumeração SMB)
- VirtualBox


## 🎯 Cenários de Ataque

### 1. Ataque FTP com Medusa

- **Serviço alvo:** vsftpd no Metasploitable  
- **Comando:**
  ```bash
  medusa -h 192.168.56.101 -U wordlists/ftp_users.txt -P wordlists/ftp_passwords.txt -M ftp

• 	Wordlists: usuários e senhas comuns
• 	Resultado: acesso obtido com 

Mitigações:
• 	Desativar FTP se não for necessário
• 	Usar SFTP com autenticação por chave
• 	Implementar fail2ban para bloqueio de IPs

2. Força Bruta em Formulário Web (DVWA)
• 	Configuração: DVWA em modo "low security"
• 	Script Python: scripts/dvwa_brute.py
• 	Wordlists: admin como usuário, senhas comuns
• 	Resultado: acesso com admin/password

Mitigações:
• 	Implementar CAPTCHA
• 	Limitar tentativas por IP
• 	Autenticação multifator


3. Password Spraying em SMB
• 	Enumeração de usuários:
enum4linux -U 192.168.56.101

• 	Ataque com Medusa:
medusa -h 192.168.56.101 -U wordlists/smb_users.txt -P wordlists/smb_passwords.txt -M smbnt

• 	Resultado: acesso com user:user

Mitigações:
• 	Políticas de senha forte
• 	Monitoramento de logs
• 	Bloqueio de conta após tentativas falhas

📚 Aprendizados
- Diferença entre brute force e password spraying
- Importância da defesa em profundidade
- Como ferramentas simples podem comprometer sistemas mal configurados

🛡️ Recomendações Gerais
- Autenticação multifator
- Monitoramento contínuo de logs
- Políticas de senha robustas
- Ferramentas de detecção de intrusão (IDS/IPS)

📌 Conclusão
Este projeto demonstrou como ataques simples podem ser eficazes em ambientes vulneráveis. A prática com ferramentas como Medusa e DVWA reforça a importância de medidas preventivas e da conscientização em segurança da informação.

