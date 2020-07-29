#import <dlfcn.h>
#import "substrate.h"
#import "SparkAppList.h"

int custom_verify_callback_that_does_not_validate(void *ssl, uint8_t *out_alert){
    return 0;
}

void (*original_SSL_set_custom_verify)(void *ssl, int mode, int (*callback)(void *ssl, uint8_t *out_alert));

void replaced_SSL_set_custom_verify(void *ssl, int mode, int (*callback)(void *ssl, uint8_t *out_alert)){
    original_SSL_set_custom_verify(ssl, mode, custom_verify_callback_that_does_not_validate);
}

__attribute__((constructor)) static void initialize() {
    NSString* bundleIdentifier = [[NSBundle mainBundle] bundleIdentifier]; 

    if([SparkAppList doesIdentifier:@"mlyx.sslpinningsetting" andKey:@"includedApps" containBundleIdentifier:bundleIdentifier]) 
    {
        void* boringssl_handle = dlopen("/usr/lib/libboringssl.dylib", RTLD_NOW);
        void* SSL_set_custom_verify = dlsym(boringssl_handle, "SSL_set_custom_verify");
        if (SSL_set_custom_verify){
            MSHookFunction(SSL_set_custom_verify, replaced_SSL_set_custom_verify, (void **)&original_SSL_set_custom_verify);
        }
    }
}




