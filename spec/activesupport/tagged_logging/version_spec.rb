require "anonymous_loader"
require "activesupport-tagged_logging"
RSpec.describe Activesupport::TaggedLogging::Version do
  it_behaves_like "a Version module", described_class

  it "executes the version file for coverage without redefining constants" do
    paths = [
      File.expand_path("../../../lib/activesupport/tagged_logging/version.rb", __dir__),
      File.expand_path("../../../lib/activesupport/tagged_logging/version_gem.rb", __dir__)
    ].select { |path| File.file?(path) }
    anonymous_namespace = AnonymousLoader.load(files: paths)

    expect(anonymous_namespace::Activesupport::TaggedLogging::Version::VERSION).to eq(described_class::VERSION)
  end
end
