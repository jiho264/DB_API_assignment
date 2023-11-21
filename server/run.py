import http.server
import socketserver

# 포트 설정 (예: 8000)
port = 8000

# 현재 디렉토리를 기준으로 HTTP 서버를 실행
Handler = http.server.SimpleHTTPRequestHandler
httpd = socketserver.TCPServer(("", port), Handler)

print(f"Serving on port {port}")
httpd.serve_forever()
