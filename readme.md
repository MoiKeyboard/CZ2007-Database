# CZ2007 Database Project
The repository contains scripts related to the final lab for CZ2007 through [MSSQL](https://github.com/microsoft/sql-server-samples).

## Prerequiste
NTUwireless VPN Access

## Optional (VScode)
For quick access to database through VSCode
1. Download the following
- [Visual Studio Code](https://code.visualstudio.com/Download)
- [SQL Server (mssql) extension](https://marketplace.visualstudio.com/items?itemName=ms-mssql.mssql)
2. Add following snippet to VSCode **settings.json** for quick connection [for more](https://docs.microsoft.com/en-us/sql/visual-studio-code/sql-server-develop-use-vscode?view=sql-server-ver15)
```
"mssql.connections": [
        {
            "server": "155.69.100.36",
            "database": "dsaig6",
            "authenticationType": "SqlLogin",
            "user": "dsaig6",
            "password": "",
            "emptyPasswordInput": false,
            "savePassword": true,
            "profileName": "CZ2007_Database"
        }
    ]
```
