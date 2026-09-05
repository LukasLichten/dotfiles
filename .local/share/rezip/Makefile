.phony: download compile all

all: download compile


download:
	curl https://raw.githubusercontent.com/costerwi/rezip/refs/heads/master/ReZip.java > ReZip.java
	curl https://raw.githubusercontent.com/costerwi/zipdoc/refs/heads/master/ZipDoc.java > ZipDoc.java
	curl https://raw.githubusercontent.com/costerwi/rezip/refs/heads/master/LICENSE.md > ReZip-License.md
	curl https://raw.githubusercontent.com/costerwi/zipdoc/refs/heads/master/LICENSE.md > ZipDoc-License.md

compile:
	javac ReZip.java
	javac ZipDoc.java
