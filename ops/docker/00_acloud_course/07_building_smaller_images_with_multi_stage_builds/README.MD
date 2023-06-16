### Building smaller image using docker's best practices

What if we can take off the preparation part of our image out of our output (final image)
So we are going to run the intermediate part of it but not including it in our finished image, taking advantage of the
layers.

In order to fulfill our goal, let's divide it in 3 steps :

* build the image with inline installation (usual way) :
* move all the installations into one layer :
* build another image and compare the image size and layers :

#### Build the image with the installations performed inline :

* command to build the image :
  `docker build -t notesapp:0.4 .`
* command to check the size of the image :
  At first create an environment variable with name showSize then run the docker command inspect formatting using it
  `export showSize='{{ .Size }}'`
  `docker inspect notesapp:0.4 -f "$showSize"`
  `docker inspect notesapp:0.4 -f "$showSize" | numfmt --to=iec` #human friendly formatting
  ==> size 1.14GB
* command to check the number of layers inside the image :
  Create an environment variable with its name showLayers then run the docker command inspect formatting using it
  `docker inspect notesapp:0.4 -f '{{ json .RootFS.Layers }}' | python3 -m json.tool`
  `export showLayers="{{ range .RootFS.Layers }}{{ println . }}{{ end }}"`
  `docker inspect notesapp:0.4 -f "$showLayers" | wc -l`
* ==> 15 layers

#### Move the intermediate installation into another layer :


