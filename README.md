## Code Challenge
## Problem statement
The challenge in this problem is to provide a customizable field to any model. The requirements are that any custom field can be persisted and queried.

## Approach
To solve the problem that the customizable fields should be configurable by each client, I used a table with two fields:
    1. Name of the model with custom fields
    2. The list of customizable fields.

To make the custom fields available to Active Record so that the user can set and access them as normal Active Record fields, I relied on Active Record's [virtual attributes](https://api.rubyonrails.org/classes/ActiveRecord/Attributes/ClassMethods.html) which I implemented using a concern. The concern reads the configuration saved in the database and injects the custom attributes into the model, if it finds a configuration saved under that model name.

Then there is the problem of persisting customisable fields. For this, I created a polymorphic association called `Customizable` which is implemented via a table called `custom_attributes`.
It has the following important fields:
- customizable_id - the ID of the item which is associated with the table.
- customizable_type - records the model for which we are creating the association
- attribute_name - name of the custom attribute
- atrribute_value - value of the custom attribute

This approach is highly flexible and easy to extend. We do not have to make our code tightly coupled with different partner's specific configurations.

## Testing
I did intend to write some tests but unfortunately time did not allow :(

My approach would have been this:

 - Create a model with some custome fields
 - Assert that an instance is saved successfully without errors
 - Assert that the custom fields are persisted successfully on the database
