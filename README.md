# MICFlow-iOS


## Set up

1. Clone the Repo, or download the zip file and extract it.
2. Change the file `Constants.swift` with your Kinvey App Key, Kinvey App Secret and MIC Redirect URI
3. To be able to login using the Safari Mobile browser you have to change the URL Scheme in the `Info.plist` file. For example, if your MIC Redirect URI is something like `kinveyAuthDemo://` you will have to replace the placeholder value `myURLScheme` to be `kinveyAuthDemo`
4. That's it! Have fun!

Take a look at our [MIC Guide](http://devcenter.kinvey.com/ios/guides/mobile-identity-connect#authenticating) for more information.
