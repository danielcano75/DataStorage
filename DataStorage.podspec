Pod::Spec.new do |spec|
  spec.name             = "DataStorage"
  spec.version          = "1.0.0"
  spec.summary          = "Generic DataStorage framework for iOS"
  spec.homepage         = "https://github.com/danielcano75/DataStorage"
  spec.license          = { :type => "MIT" }
  spec.author           = { "danielcano75" => "daniel.cano.arbelaez@gmail.com" }
  spec.platform         = :ios, "16.0"
  spec.swift_versions   = "5.0"
  spec.source           = {
    :http => "https://github.com/danielcano75/DataStorage/releases/download/v1.0.0/DataStorage.xcframework.zip"
  }
  spec.vendored_frameworks = "DataStorage.xcframework"
end
