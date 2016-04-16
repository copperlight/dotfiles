# Introduction

This is a collection of useful dotfiles.  Clone this locally, and then initialize the dots:

```
./init-dots.sh
```

This will handle all of the work associated with getting a decent profile configuration in place, suitable for Python and Clojure development.

# Configuration Features

Here is an overview of the main configuration features contained in this repo.

## Secret Safety

Checking in secrets is no good, but it can be useful to have secrets configured as environment variables. Support has been added for a `$HOME/.dotfiles.d` directory, which contains snippets of secrets that are sourced from the main profile.  The snippets should not have anything more complex than simple exports.

## Clojure

Configures a leiningen profile that supports the lein-exec plugin, which makes it [easy to run executable Clojure scripts](https://koodo.wordpress.com/2013/11/09/shell-scripting-with-clojure/) from the command line, like so:

```
#!/usr/bin/env lein-exec

(require 'leiningen.exec)
 
;; Add a dependency to the classpath on the fly
(leiningen.exec/deps '[[enlive/enlive "1.1.4"]])
 
(require '[net.cgrand.enlive-html :as html])
 
;; Grab and print the title element from the Google front page using Enlive
(println (html/select (html/html-resource (java.net.URL. "http://google.com")) [:title]))
```
(Pomegranate)[https://github.com/cemerick/pomegranate] has been added as a dependency for the repl.  This makes it easy to interactively add dependencies in a repl session, like so:

```
(use '[cemerick.pomegranate :only (add-dependencies)])

(add-dependencies :coordinates '[[incanter "0.5.0"]]
                  :repositories (merge cemerick.pomegranate.aether/maven-central
                                       {"clojars" "http://clojars.org/repo"}))

(use 'stencil.core)
(render-string "Hi there, {{name}}."
               {:name "Donald"})
```

## SublimeText

1. SublimeLinter.
    1. Disable flake8 line length warnings.
    1. Point to pyenv shims as a source for Python binaries.
    1. Point to location of scalastyle.
    1. Add generated color schemes with BracketHighlighter support.
1. Fix Groovy comment toggle.
1. Configure colors for BracketHighlighter.
1. Disable single-quote matching for Clojure files.
1. Disable Git status bar.
1. Associate .gradle files with Groovy.
1. Set Scala indents to two spaces.
1. Configure a reasonable prompt for SublimeREPL Shell.
1. Associate cljc files with Clojure.


Getting Soda Theme, BracketHighlighter and SublimeLinter to play together is an unusual process.  You have to manually download the color schemes for Soda and drop them into place in the User directory, then edit them to add BracketHighlighter colors for the gutter icons.  After this, you have to manually set your color scheme to this modified scheme, then quit SublimeText and restart.  SublimeLinter will detect the modified scheme in use and generate a new one with its own gutter configuration additions.  The resulting generated files are saved in the dotfile collection.

## vim

This provides a fairly minimal vim configuration that adds reasonable syntax highlighting for a few languages and a couple of features.  With this, it should be fairly painless to go on with basic vim usage.

1. Configures Pathogen.
1. Sets Solarized color scheme and paste toggle key.
1. Plugin bundles defined in update_bundles.py; rerun this to update bundles.
