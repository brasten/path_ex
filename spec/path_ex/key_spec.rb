require "spec_helper"

module PathEx
  describe Key do
    context "with single level path" do
      subject(:key) { Key.new("users") }

      specify "#head returns path" do
        expect( key.head ).to eql("users")
      end

      specify "#tail returns nil" do
        expect( key.tail ).to be_nil
      end
    end

    context "with three-level path" do
      subject(:key) { Key.new("users.name.first") }

      specify "#head returns first level" do
        expect( key.head ).to eql("users")
      end

      specify "#tail returns remaining levels" do
        expect( key.tail ).to eql("name.first")
      end
    end


  end
end
