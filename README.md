# gRPC POC - A gRPC Proof of concept

![](https://travis-ci.org/pacu/gRPC-lightwalletd-PoC.svg?branch=master)
## Motivation 
test Swift-GRPC services using lightwalletd nodes

### installing 
Install Sourcery and put it in your PATH variable or 
``` brew install sourcery```

Clone and run ```pod install``` 

### setting it up
We don't like to commit address so the environment has to be set up from environment variables. This project users Sourcery to generate a Swift file with the secret environment variables from a template and a value you provide before compiling your sources. 

*Constants generated sources*
```` 
public struct Constants {
    static let address: String = "{{ argument.addr }}"
}
````


#### Setting your 'LIGHTWALLETD_ADDRESS' environment variable (sh file option)
on your Source directory, create the file: ```env-vars.sh```
```` bash
export LIGHTWALLETD_ADDRESS=YOUR_BASH_ESCAPED_ADDRESS
````

#### Setting your 'LIGHTWALLETD_ADDRESS' environment variable 
Make sure that there's a value for the variable ```LIGHTWALLETD_ADDRESS``` when the build is triggered.

This will make the Script on the "run script" phase get the correct environment variable for you. If running on CI, you can set the ENVIRONMENT_VARIABLE directly. (you can do that on your dev environment as well)
If you take a look at the environment class, you will see that it will expect to get it from the ```LIGHTWALLETD-ADDRESS``` key.



**important: in order for code generation to work, it's important to enforce the Legacy Build System to be used :(**

```` swift 
class Environment {
    static let lightwalletdKey = "LIGHTWALLETD_ADDRESS"
    
    static var address: String {
        return Constants.address
    }
}
````

### Testing
You can verify that the environment is being set up properly by running the tests

```` swift 
 func testEnvironmentLaunch() {
        
        let address = gRPC_PoC.Environment.address
        
        XCTAssertFalse(address.isEmpty, "Your \'\(Environment.lightwalletdKey)\' key is missing from your launch environment variables")
    }
    
````


### Running it 
If you did everything correctly and your tests pass you should see this

<img src="images/block_size.png" width=30%>


Otherwise you will see this when running 

<img src="images/block_failed.png" width=30%>


## Contributing
If you find any issues please create one. 

## License
Apache License Version 2.0 

