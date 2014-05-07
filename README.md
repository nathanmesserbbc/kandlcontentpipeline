# Introduction

This project provides a prototype content pipeline for content analysis

# Getting Started

Note: This has only been tested on a Mac, it should work on other *nix systems.

* Install RVM and switch to ruby-1.9.3 - rvm use 1.9.3-head
* Install bundler - gem install bundler
* Install gem dependancies - bundle install
* Install Apache Mahout

## Note on apache mahout

Using brew:

* brew install mahout
* brew uninstall hadoop
* brew install homebrew/versions/hadoop121

See: http://stackoverflow.com/questions/22702947/mahout-0-9-and-hadoop-2-2-0-found-interface-org-apache-hadoop-mapreduce-jobcon

# How does it work ?

The pipeline can be seen as 3 steps:
* aquire
* extract
* recommend

## Aquire

This step identifies content to be operated on and downloads the pages identified.  It is performed in two steps:
* Retrieve some source content links and persists them
* Download content from above links and persist it

This can be achieved by running three scripts:
./scripts/retrieve_links.sh arts
./scripts/retrieve_content.sh

This queries google for the top 10 pages of search results for bbc.co.uk/arts and persists them into content/links.  The content is then retrieved and persisted into content/files and finally the body text is extracted for each page and persisted into content/processed.

## Extract

This step operates on the downloaded content from content/files, it extracts the body text for each page and persists the extracted content into content/processed.

This can be achieved by running:
./scripts/extract_content.sh

These first two steps can be repeated for new domains and existing content will be persisted with only new content being downloaded and oeprated on.

## Recommend

This step transforms the downloaded and extracted content into a form suitable for Apache Mahout and then runs a similarity algorithm over the content to produce similarity matrix for the pages.  This similarity matrix can then be persisted into a RDBMS or other storage system.

This can be achieved by running:
./scripts/mahout_transform.sh
./scripts/analyse_data.sh



