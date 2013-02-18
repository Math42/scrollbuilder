Pod::Spec.new do |s|
  s.name         = "SFScrollBuilder"
  s.version      = "0.1"
  s.summary      = "An auto builder of scrollable side by side views with Paging and PageControl "
  s.homepage     = "https://github.com/Math42/scrollbuilder/SFScrollBuilder"

  s.license      = 'MIT (example)'
  s.author       = { "Biard Mathias" => "matsou03@gmail.com" }
  s.source       = { 
	:git => "https://github.com/Math42/scrollbuilder.git",
	:tag => "0.1" }
  s.platform     = :ios, '6.0'
  
  s.source_files = 'SFScrollBuilder/SFScrollBuilder.{h,m}';

end
