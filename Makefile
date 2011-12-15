PYTHON_CODE = "import json;\
		 	   f = open('manifest.json', 'r');\
			   manifest = json.loads(f.read());\
     		   manifest['version'] = str(int(manifest['version']) + 1);\
 			   f = open('manifest.json', 'w');\
			   f.write(json.dumps(manifest, indent=4));\
			   f.close()"

deploy:
	# Change the version number of the manifest
	$(shell python -c $(PYTHON_CODE))
	# Compile the new extension on the desktop
	zip $(HOME)/Desktop/grooveshark-forkard.zip manifest.json icons/* popup.html background.html
