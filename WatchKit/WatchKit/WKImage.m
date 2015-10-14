#import <UIKit/UIKit.h>
#import "WKImage.h"

@implementation WKImage

+ (instancetype)imageWithImage:(UIImage *)uiImage {
    WKImage *image = [self new];
    image->_image = uiImage;
    return image;
}

+ (instancetype)imageWithImageData:(NSData *)imageData {
    WKImage *image = [self new];
    image->_imageData = [imageData copy];
    return image;
}

+ (instancetype)imageWithImageName:(NSString *)imageName {
    WKImage *image = [self new];
    image->_imageName = [imageName copy];
    return image;
}

#pragma mark - NSObject

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[self class]]) { return NO; }
    WKImage *other = object;

    if (self.image != other.image && ![self.image isEqual:other.image]) { return NO; }
    if (self.imageData != other.imageData && ![self.imageData isEqual:other.imageData]) { return NO; }
    if (self.imageName != other.imageName && ![self.imageName isEqual:other.imageName]) { return NO; }

    return YES;
}

- (NSUInteger)hash {
    return [self.image hash] + [self.imageData hash] + [self.imageName hash];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

#pragma mark - NSSecureCoding

+ (BOOL)supportsSecureCoding {
    return YES;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        _image = [aDecoder decodeObjectOfClass:[UIImage class] forKey:NSStringFromSelector(@selector(image))];
        _imageData = [aDecoder decodeObjectOfClass:[NSData class] forKey:NSStringFromSelector(@selector(imageData))];
        _imageName = [aDecoder decodeObjectOfClass:[NSString class] forKey:NSStringFromSelector(@selector(imageName))];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    if (self.image) { [aCoder encodeObject:self.image forKey:NSStringFromSelector(@selector(image))]; }
    if (self.imageData) { [aCoder encodeObject:self.imageData forKey:NSStringFromSelector(@selector(imageData))]; }
    if (self.imageName) { [aCoder encodeObject:self.imageName forKey:NSStringFromSelector(@selector(imageName))]; }
}

@end
