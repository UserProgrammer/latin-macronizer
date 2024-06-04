morpheus
========

Morpheus parser code.

Compiling and installing morpheus
---------------------------------
By default morpheus installs into bin/
```
  cd src
  make
  make install
```

Adding stem library in new file
-------------------------------
Verb stem files must include the substring 'vbs'.
Noun stem files must include the substring 'nom'.

```
  cd stemlib/Latin/stemsrc
  touch vbs.custom
```

Look at other vbs* files for examples of how to
populate the new file with the new word(s).

For verb files, edit the VBFILES variable in
stemlib/Latin/makefile to include the path to
the new file. For the example above, you
would add the following: 'stemsrc/vbs.custom'.

The makefile does not need to be updated for new
noun stem files. Make sure that the noun stem file
filename follows this pattern "nom.[0-9]+". Look
at the existing noun stem files for examples.

Compiling a stem library
------------------------
```
  cd stemlib/Latin
  export PATH=$PATH:../../bin
  MORPHLIB=.. make
```

Running the cruncher
--------------------
```
MORPHLIB=stemlib bin/cruncher < wordlist > crunched
```
