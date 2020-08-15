# Source Code Organization

## Web 

* `apps`: Contains all application.
    * `web`: Web applications that can be deployed to firebase hosting.
        * `demo`: The demo application.
        * `demo-e2e`: The end to end testing for `app`.
        * `debug`: The main debug dashboard web application.
        * `debug-e2e`: The end to end testing for debug application.
        * `admin`: The super admin portal.
    
    * `backend`: Contains all backend applications. 
        * `functions`: The firebase functions application. It runs with expressjs node framework.
        TODO: This will be refactor to `firebase-functions`.

* `libs`: Contains all reusable libraries.
    * `shared`: Node packages that can be shared for both frontend and backend application.
        * `api-core`: Contains common data models, etc. This module can be used by web frontend as well.
    * `web`: Contains just web libraries.
        * `ag-ui`: Reusable UI
        * `api-client`: Library to provide core apis.
        * `api-guest-client`: Library to access guest apis.
        * `api-app-client`: Library to access app apis.
        * `api-admin-client`: Library to access admin apis.
        
    * `backend`: Contains backend libraries.


* `dist`: This directory generated during building process. It contains compiled, distributable artifacts. 
It is categorized into `libs`, `apps`, ... that map the source directory structure.

## Dotfiles

* `.env`: This directory generated during development. It provides environment variables for build process. 
For instance, firebase service account configuration will be copied there depending on the deployment environment.

* `.nvmrc`: The nodejs version to run with. 

* `.firebaserc`, `storage.rules`,  `firebase.json`, `firebase.indexes.json`, `firebase.rules`:  
Provides the default firebase project setting. These files might be refactored somewhere else later.

* `package.json`: Provides the common npm dependencies for all sub projects. This directory used for both
frontend and backend work. 

* `tsconfig.json`, `tslint.json`: Provides common typescript settings for other sub projects to use.

* `angular.json`: Provides settings for angular project.

* `jest.config`: Provides jest configuration for testing.

* `nx.json`: NX Monorepos settings
