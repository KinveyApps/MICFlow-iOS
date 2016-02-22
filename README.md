# MICFlow-iOS

This application showcases using the Mobile Identity Connect (MIC) authorization-grant login flow from Kinvey's client libraries.

Mobile Identity Connect is a service that bridges mobile applications with existing enterprise identity and single sign-on solutions. MIC enables mobile applications to integrate with a variety of identity solutions using a single OAuth2-based interface. This allows enterprise application developers to avoid the complexity of integrating these protocols into mobile, while providing enterprise IT the means to ensure that access to resources is secured only to authenticated users, as well as maintaining full control over a mobile user's identity.

## Prerequisite

This Kinvey app needs an Enterprise plan. Contact Kinvey sales if you don't have one.

## Console Set up
1.  Visit the __User__ Section of the [console](https://console.kinvey.com).
2.  Click the __Auth Source__ tab at the top of the page
3.  Set the `Type of Provider` to be `Custom`
4.  In the `Provider URL`, enter: `https://authlinkdemo.herokuapp.com/authenticate`
5.  In the `Redirect URI's: ` enter: `kinveyAuthDemo://`

The above Auth Provider sample can be used with the username: `test` and the password: `test`.


## Set up

1. Clone the Repo, or download the zip file and extract it.
2. Change the file `Constants.swift` with your Kinvey App Key, Kinvey App Secret and MIC Redirect URI
3. To be able to login using the Safari Mobile browser you have to change the URL Scheme in the `Info.plist` file. For example, if your MIC Redirect URI is something like `kinveyAuthDemo://` you will have to replace the placeholder value `myURLScheme` to be `kinveyAuthDemo`
4. That's it! Have fun!

Take a look at our [MIC Guide](http://devcenter.kinvey.com/ios/guides/mobile-identity-connect#authenticating) for more information.
