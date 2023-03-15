terraform {
  backend "azurerm" {
    resource_group_name  = "N01520500-assignment1-RG"
    storage_account_name = "tfstate0500"
    container_name       = "tfstate"
    key                  = "Xy+3aXtYVJ/LzPJt3RQUhoy60SBJ44qYmUKkY0UZlGdQpM3DUs45fXnYIGg6ueJnj2JruGa3qqMQ+AStuM/FQA=="
  }
}
