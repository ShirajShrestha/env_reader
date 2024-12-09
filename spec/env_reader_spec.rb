require "env_reader"
require "tempfile"

RSpec.describe EnvReader do
  it "extracts keys from a .env file" do
    Tempfile.create(".env") do |file|
      file.write("KEY=value\nSECRET_KEY=secret123\nDATABASE_URL=postgres://localhost\n")
      file.rewind

      expected_output = <<~OUTPUT
        KEY
        SECRET_KEY
        DATABASE_URL
      OUTPUT

      expect {
        EnvReader.read_keys(file.path)
      }.to output(expected_output).to_stdout
    end
  end

  it "handles missing files" do
    expect{
      EnvReader.read_keys("nonexistent.env")
  }.to output(/File not found/).to_stdout
  end
end