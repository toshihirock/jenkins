jenkins Cookbook
================

最新のJenkinsをインストールします。

Usage
-----

clone`run_list`に以下のように追記してください。

	{
	  "name":"my_node",
	  "run_list": [
	    "recipe[jenkins]"
	  ]
	}

