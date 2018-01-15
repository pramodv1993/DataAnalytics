# EndSemProject

The project is a prototype of a utility that aggregates structured information with analytics included.
The tool crawls the job portals for relevant information.
Structuring is done in a Hadoop's  tool HCatalog.
The crawled data is parsed and embedded with a custom delimiter which is used as reference by HCatalog.
The HDFS structuring part isn't included here as it is a UI tool and must be deployed in relevent servers.

The information is also used for some simple internal analytics and depicted graphically using Google Charts.
