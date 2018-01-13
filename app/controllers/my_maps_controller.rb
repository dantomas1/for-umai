class MyMapsController < ApplicationController

def index
 @a = [1,2,3,4]
 @b = []
  @a.map do |x|
   @b << x + 1
   end
   @c = @a.map(&:to_s)
 end

end
