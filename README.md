# WIP PortSwig-Lab-Solutions 

#### This repo is going to be a part of collection of solutions for Web Application Security labs using real tools for the sake of practicing and following along.

I'll cover the following sections found on PortSwigger:
- SQL injection
- Cross-site scripting
- Cross-site request forgery (CSRF)
- Clickjacking
- DOM-based vulnerabilities
- Cross-origin resource sharing (CORS)
- XML external entity (XXE) injection
- Server-side request forgery (SSRF)
- HTTP request smuggling
- OS command injection
- Server-side template injection
- Path traversal
- Access control vulnerabilities
- Authentication
- WebSockets
- Web cache poisoning
- Insecure deserialization
- Information disclosure
- Business logic vulnerabilities
- HTTP Host header attacks
- OAuth authentication
- File upload vulnerabilities
- JWT
- Essential skills
- Prototype pollution
- GraphQL API vulnerabilities
- Race conditions
- NoSQL injection
- API testing
- Web LLM attacks
- Web cache deception


## Commands

Run with X11 GUI Support
```
xhost +local:docker
```

```
docker build -t burpsuite-community .

docker run -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  --hostname burpsuite \
  -it --rm \
  --name burpsuite \
  burpsuite-community
```


### ToDo / Notes
- Clean up of ReadMe`s will happen later.
 