#  Model pack 

![image](https://trello-attachments.s3.amazonaws.com/5f3d3a2e4ce4a86f2de41eae/5f4be3c01cdc977935811c94/c6d92a4e511f1562b2a3975b99d2d833/model-pack.png)

## Elements

* Package
    * Has many `Type`.
* Type
    * Has many `Mixin`, they also a `Type`.
    * Hah many `Field`.
* Field
    * Has a `Type`.
    * Has many `Rule` associated with it. For instance, a field is required.
* Rule
    * Has many `Pattern` associated with it. For instance, a pattern is url, email, etc.    
* Kind
