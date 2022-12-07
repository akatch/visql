# viSQL

## Setup
Mac users should install [`macvim`](https://macvim-dev.github.io/macvim/) as it is more performant than the stock macOS `vim`.

To configure viSQL for your user, simply run

    ./setup.sh

Or for all users on a system,

    sudo ./setup.sh -g

## Helpful metacommands
Use arrow keys to scroll through previously issued queries

    \e                                             to edit most recent query in editor (by default vim)
    \d <table name>                                to show table make up -- note wildcards can be used
    \dt <schema.*>                                 to show a listing of tables in a schema -- public is default schema
    \i <file name>                                 to execute sql from a file
    \copy (<query>) to '<path>' with csv header;   to copy query output to csv file with headers
    \c <database>                                  to switch your connection to a new database
    \l                                             to list databases
    \?                                             for help on meta commands
