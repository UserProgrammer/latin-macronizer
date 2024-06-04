# Overview
This project provides a Postgres database with a list of latin words. The primary utility of this
database is to look up accented latin words.


# Running locally
To spin up the Execute `script/server`

Once the database is running, execute `script/connect`. You will be prompted for a password, which
is 'adminuser'.

Refer to the section `Useful psql commands` below for some useful commands for nagivating the database.

## Understanding the database
At this point, you can query the database for latin words. Before you do so, its worth spending some
time reviewing the structure of the database. The database name is `macronizer`. The relevant table
within this database is `morpheus`. The table consists of five columns:
- id
- wordform
- morphtag
- lemma
- accented

### id
The numeric ID for identifying a word.

### wordform
A declined/conjugated latin word

### morphtag
The morphological analysis for the word. This field is 9 characters long, and corresponds to the following morphological features:

            1: 	part of speech
			
				n	noun
				v	verb
				t	participle
				a	adjective
				d	adverb
				c	conjunction
				r	preposition
				p	pronoun
				m	numeral
				i	interjection
				e	exclamation
				u	punctuation
			
			2: 	person
			
				1	first person
				2	second person
				3	third person
			
			3: 	number
			
				s	singular
				p	plural
			
			4: 	tense
			
				p	present
				i	imperfect
				r	perfect
				l	pluperfect
				t	future perfect
				f	future
			
			5: 	mood
			
				i	indicative
				s	subjunctive
				n	infinitive
				m	imperative
				p	participle
				d	gerund
				g	gerundive
				u	supine
			
			6: 	voice
			
				a	active
				p	passive
			
			7:	gender
			
				m	masculine
				f	feminine
				n	neuter
			
			8: 	case
			
				n	nominative
				g	genitive
				d	dative
				a	accusative
				b	ablative
				v	vocative
				l	locative
			
			9: 	degree
			
				c	comparative
				s	superlative
			
			---
			
			For example, the postag for the adjective "alium" is "a-s---ma-", 
			which corresponds to the following features:
			
			1: a	adjective
			2: -
			3: s	singular
			4: -
			5: -
			6: -
			7: m	masculine
			8: a	accusative
			9: -

### lemma
The base lemma from which the word is derived.

### accented
The same as `wordform`, with the addition of special symbols which represent accents to be included
in the written form, or description on how to pronounce the word.

## How to query the `morpheus` table
If you're looking for an accented version of a wordform, the following SQL query template should be
used:

`select * from morpheus where wordform = '<wordform>'`

for example:

`select * from morpheus where wordform = 'pueri'`

This will sometimes return multiple results, given that there are some wordforms which are
written/spoken the same way. If you want to reduce the resultset to a single result, you can use the
following query template:

`select * from morpheus where wordform = '<wordform>' and morphtag = '<morphtag>'`

for example:

`select * from morpheus where wordform = 'pueri' and morphtag = 'n-p---mn-'`

This query will search for a noun in the plural, masculine, nominative form.


# Useful psql commands
- `\l` will list the available databases
- `\c <database name>` will connect to a specific database, afterwhich SQL commands will be executed
  against it
- `\dt` will list out the tables belonging to the currently-selected database

For more information, go here: https://www.atlassian.com/data/admin/how-to-list-databases-and-tables-in-postgresql-using-psql
