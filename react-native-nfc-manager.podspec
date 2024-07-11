require "json"

json = File.read(File.join(__dir__, "package.json"))
package = JSON.parse(json).deep_symbolize_keys

Pod::Spec.new do |s|
  s.name         = "react-native-nfc-manager"
  s.version      = package[:version]
  s.license      = { type: "MIT" }
  s.homepage     = package[:repository][:url]
  s.authors      = package[:author]
  s.summary      = package[:description]
  s.source       = { git: package[:repository][:url], tag: s.version.to_s }
  s.source_files = "ios/**/*.{h,m}"
  s.platform     = :ios, "8.0"
  s.dependency   "React-Core"

  s.xcconfig = {
    'OTHER_LDFLAGS' => '-weak_framework CoreNFC',
  }
end
