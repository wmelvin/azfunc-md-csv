# azfunc-md-csv

> Notice: This repository contains exploratory work and is intended to be reference material rather than a maintained project or finished product. It is *not open for contributions* and may be deleted at some point.

Explore using the **Azure Functions Core Tools** (and other tools, such as VS Code extensions) to build a Python Azure Functions application.

### Azure Functions Core Tools

Followed the installation instructions for Linux (Ubuntu): [Work with Azure Functions Core Tools](https://learn.microsoft.com/en-us/azure/azure-functions/functions-run-local?tabs=v4%2Clinux%2Cpython%2Cazurecli%2Cbash#install-the-azure-functions-core-tools)

*Caution: The commands below worked at the time of installation for this project. Refer to source documents from Microsoft when doing a new installation.*

Get the key used to verify the package source from Microsoft and create a sources list entry.

```bash
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg

sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-$(lsb_release -cs)-prod $(lsb_release -cs) main" > /etc/apt/sources.list.d/dotnetdev.list'
```

Check the results (*focal* is supported).
```bash
cat /etc/apt/sources.list.d/dotnetdev.list
```

> `deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-focal-prod focal main`


Continue with installation.

```bash
sudo apt-get update

sudo apt-get install azure-functions-core-tools-4
```

---

### Azurite

**Install the Azurite extension in VS Code**

See: [Use Azurite emulator for local Azure Storage development](https://learn.microsoft.com/en-us/azure/storage/common/storage-use-azurite?tabs=visual-studio-code#install-azurite)


**Configure the project to use Azurite**

In `local.settings.json`
change `"AzureWebJobsStorage": ""` 
to `"AzureWebJobsStorage": "UseDevelopmentStorage=true"`.

---

*To be continued...*