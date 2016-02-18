#!/usr/bin/env python

import argparse
import git
import os
import requests
import shutil

git_bundles = [
    "git://github.com/airblade/vim-gitgutter",
    "git://github.com/altercation/vim-colors-solarized",
    "git://github.com/astashov/vim-ruby-debugger.git",
    "git://github.com/corntrace/bufexplorer",
    "git://github.com/dag/vim-fish.git",
    "git://github.com/derekwyatt/vim-scala",
    "git://github.com/fatih/vim-go.git",
    "git://github.com/guns/vim-clojure-static.git",
    "git://github.com/hallison/vim-rdoc.git",
    "git://github.com/ktvoelker/sbt-vim",
    "git://github.com/msanders/snipmate.vim.git",
    "git://github.com/pangloss/vim-javascript.git",
    "git://github.com/scrooloose/nerdtree.git",
    "git://github.com/timcharper/textile.vim.git",
    "git://github.com/tpope/vim-cucumber.git",
    "git://github.com/tpope/vim-fugitive.git",
    "git://github.com/tpope/vim-git.git",
    "git://github.com/tpope/vim-haml.git",
    "git://github.com/tpope/vim-markdown.git",
    "git://github.com/tpope/vim-rails.git",
    "git://github.com/tpope/vim-repeat.git",
    "git://github.com/tpope/vim-sensible",
    "git://github.com/tpope/vim-surround.git",
    "git://github.com/tpope/vim-vividchalk.git",
    "git://github.com/tsaleh/vim-tmux.git",
    "git://github.com/tfnico/vim-gradle.git",
    "git://github.com/vim-ruby/vim-ruby.git",
    "git://github.com/vim-scripts/Gist.vim.git",
]

vim_org_scripts = [
    ["IndexedSearch", "7062", "plugin"],
    ["jquery", "12107", "syntax"],
]

parser = argparse.ArgumentParser()
parser.add_argument('--force', action="store_true", help="force update")
args = parser.parse_args()

bundles_dir = "{}/bundle".format(os.path.dirname(os.path.abspath(__file__)))
os.chdir(bundles_dir)

if args.force:
    print("FORCE UPDATE: remove existing bundles")
    for dir in os.listdir('.'):
        shutil.rmtree(dir)

for url in git_bundles:
    dir = url.split('/')[-1].replace('.git', '')
    if not os.path.isdir(dir):
        try:
            git.Repo.clone_from(url, dir, branch="master")
            print("clone {} into {}".format(url, dir))
        except git.GitCommandError:
            print("FAILED: clone {} into {}".format(url, dir))
    else:
        try:
            repo = git.Repo(dir)
            o = repo.remotes.origin
            o.pull()
            print("pulling {} into {}".format(url, dir))
        except git.GitCommandError:
            print("FAILED: pulling {} into {}".format(url, dir))

for name, script_id, script_type in vim_org_scripts:
    local_file = "{0}/{1}/{0}.vim".format(name, script_type)
    dir = os.path.dirname(local_file)
    if not os.path.isdir(dir):
        os.makedirs(dir)
    if not os.path.isfile(local_file):
        print("downloading {}".format(name))
        url = "http://www.vim.org/scripts/download_script.php?src_id={}".format(script_id)
        r = requests.get(url, stream=True)
        with open(local_file, "wb") as f:
            for chunk in r.iter_content(chunk_size=1024):
                if chunk:  # filter out keep-alive new chunks
                    f.write(chunk)
    else:
        print("script exists {}".format(name))
