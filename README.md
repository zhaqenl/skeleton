Skeleton
========


<a name="toc">Table of contents</a>
-----------------------------------

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Structure](#structure)
- [Posts](#posts)
- [Building](#building)
- [Miscellany](#miscellany)


<a name="overview">Overview</a>
-------------------------------

This is the skeleton of the [blog](https://ebzzry.io) that I use with emem. Change it as it suits
you.


<a name="prerequisites">Prerequisites</a>
-----------------------------------------

- [emem](https://github.com/ebzzry/emem)
- [parallel](https://www.gnu.org/software/parallel/)


<a name="structure">Structure</a>
---------------------------------

There is a top-level `Makefile` that handles the files that reside in the root directory. There is another `Makefile` that lives inside the `en/` directory. The key variables to modify there are: `OG_IMAGE`, and `ANALYTICS`. The other parts of the Makefiles that must be modified are the values for the `-D`, `-K`, `--og-title`, and `--og-url` flags.

The URL in the file `index.html` must also be updated accordingly.

The contents of the file `en/src/index.md` will be rendered as the index file for the `en/` directory.


<a name="posts">Posts</a>
-------------------------

To write posts, write Markdown files in `en/src/`. The first line will will serve as the page title and the value of `OG_TITLE` in the Makefile. The rest is free form. In addition to the source Markdown files, write the equivalent `.md.dat` files, per `.md` files. The contents of this file will be used for the site keywords.

The file `en/src/footer.md` is appended to every file in `en/src/` during the build phase. The file `src/404.md` serves as the 404 page.


<a name="building">Building</a>
-------------------------------

Inside the root directory, run:

    make

If you use Nixpkgs, instead run:

    nix-shell --pure --run make

If we have the file `en/src/foo.md`, this command creates the equivalent `en/foo/index.html` file. If you want GitHub to host your pages, go [here](https://pages.github.com/). You may then push this directory to that repository.


<a name="previewing">Previewing</a>
-----------------------------------

To see how the site will look like, run a local web server:

    python -m SimpleHTTPServer

Then, go to http://localhost:8000/en


<a name="miscellany">Miscellany</a>
-----------------------------------

GNU Parallel is not a hard requirement but it makes building much faster. Also, don’t forget to
update the README and LICENSE files.
