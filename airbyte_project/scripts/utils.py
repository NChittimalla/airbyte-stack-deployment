import base64

def get_encoded_credentials(username, password):
    credentials = f"{username}:{password}"
    return base64.b64encode(credentials.encode('utf-8')).decode('utf-8')
