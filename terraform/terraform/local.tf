terraform{
    required_providers{
        local={
            source="hashicorp/local"
            version= "2.6.1"
        }
    }
}

provider "local" {
    # configuration options
}
resource "local_file" "example"{
    filename  = "new.txt"
    content = "we are learning terraform "

}
