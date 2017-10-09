![b191ba7c6456d71b25cb65bbdfd20303.png](https://anonimag.es/i/b191ba7c6456d71b25cb65bbdfd20303.png)

#### Abstract 
*Using the original zip bomb concept, we can send a gziped web-page (standard compressed web-page) to the client.*  
*The browser will unzip the small compressed page into a very big file, potentially crashing it.*  
*This aims to disrupt or crash bots that scan websites to find vulnerabilities.*

>GZip HTTP Bombing in Python for everyone.  
  
>It even has it's own low effort logo.  

>Please keep in mind this is a *counter-measure*.  

>Based on this [excellent piece by Christian Haschek](https://blog.haschek.at/2017/how-to-defend-your-website-with-zip-bombs.html)   

# Flask Bomb - Python GZIP-Bomb HTTP Server 

This repository contains the necessary files to:  
* Host a quick & dirty Flask server that responds to requests with a GZip archive as a response page.  

* The recommended way to try this is by deploying it with Docker. You can try it here: **PWD LOGO+LINK**  

### Features:
* Quick and easy
* Fast deployment using docker
* Very generic code
  * Implement your own rules or payloads !
* (next)User-Agent evasion based on original work
* Choose classic payload generation or faster append generation method    

### Usage:
````bash
docker run -it -p 80:5000 khanon/flaskbomb <normal|fast> <X> # X is the final payload's size in GB  
# Example:  
docker run -it -p 80:5000 khanon/flaskbomb fast 20
````

### Demo

**ASCINEMA**

### Details & Notes
* Python 3
* The payload is generated using ```gzip``` and ```dd``` on Docker entrypoint.
  * *NIX based for now
  * Full python payload is up for next release
* Flask development server is used. It is recommended to deploy the application on a WGSI + HTTPD
* Gzip's algorithm enables the possibility to append archives
  * ```normal``` method generates the payload in one single ```dd``` command
  * ```fast``` method generates a 1Gb payload and appends itself n times. The final payload is bigger but generates much faster.
* For those not using docker, generate the payload using the bash commands in ```entrypoint.sh``` and save it as ```./static/cake.gzip``` 
  * The python GZip implementation should make this easier in the future


### Roadmap  
[ ] Evasion  
[ ] Python gzip implementation  
[ ] Load evasion URIs from DirBuster  
[ ] Fingerprinting JS before payload delivery  
