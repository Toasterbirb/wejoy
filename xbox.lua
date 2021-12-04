devices =
{
	kbd0 = "/dev/input/by-id/usb-Razer_Razer_BlackWidow-event-kbd"
}

v_devices =
{
   v0 =
   {
	  vendor = 0x0e6f,
	  productid = 0x02c1,
      buttons = 11,
      axes = 8
   }
}

axis_0 = 0
axis_1 = 0
axis_2 = 0
axis_3 = 0
axis_4 = 0
axis_5 = 0
axis_6 = 0
axis_7 = 0
b3 = 0

function normalize (axis)
   if axis < -32767 then
      axis = -32767
   elseif axis > 32767 then
      axis = 32767
   end
   return axis
end

function kbd0_pressed(value)
   --TODO: Receive multiple events if a key is long pressed
   if value == KEY_LEFT then
     axis_0 = -32767
   elseif value == KEY_RIGHT then
	 axis_0 = 32767
   elseif value == KEY_UP then
     axis_1 = -32767
   elseif value == KEY_DOWN then
     axis_1 = 32767
   --elseif value == KEY_J then
   --  axis_2 = axis_2 - 10000
   --elseif value == KEY_L then
   --  axis_2 = axis_2 + 10000
   --elseif value == KEY_K then
   --  axis_3 = axis_3 - 10000
   --elseif value == KEY_I then
   --  axis_3 = axis_3 + 10000
   elseif value == KEY_U then
      send_button_event(0, 0, 1)
   elseif value == KEY_J then
      send_button_event(0, 1, 1)
   elseif value == KEY_I then
      send_button_event(0, 2, 1)
   elseif value == KEY_K then
      send_button_event(0, 3, 1)
   elseif value == KEY_P then
	  send_button_event(0, 7, 1)
   end

   axis_0 = normalize(axis_0)
   axis_1 = normalize(axis_1)
   axis_2 = normalize(axis_2)
   axis_3 = normalize(axis_3)

   print("axis_0: ", axis_0 )
   print("axis_1: ", axis_1 )
   print("axis_2: ", axis_2 )
   print("axis_3: ", axis_3 )
   send_axis_event(0, 0, axis_0)
   send_axis_event(0, 1, axis_1)
   send_axis_event(0, 2, axis_2)
   send_axis_event(0, 3, axis_3)
end

function kbd0_released(value)
	if value == KEY_LEFT then
		axis_0 = 0
	elseif value == KEY_RIGHT then
		axis_0 = 0
	elseif value == KEY_UP then
		axis_1 = 0
	elseif value == KEY_DOWN then
		axis_1 = 0
	elseif value == KEY_U then
		send_button_event(0, 0, 0)
	elseif value == KEY_J then
		send_button_event(0, 1, 0)
	elseif value == KEY_I then
		send_button_event(0, 2, 0)
	elseif value == KEY_K then
		send_button_event(0, 3, 0)
	elseif value == KEY_P then
		send_button_event(0, 7, 0)
	end

	axis_0 = normalize(axis_0)
   	axis_1 = normalize(axis_1)
   	axis_2 = normalize(axis_2)
   	axis_3 = normalize(axis_3)

   	print("axis_0: ", axis_0 )
   	print("axis_1: ", axis_1 )
   	print("axis_2: ", axis_2 )
   	print("axis_3: ", axis_3 )
   	send_axis_event(0, 0, axis_0)
   	send_axis_event(0, 1, axis_1)
   	send_axis_event(0, 2, axis_2)
   	send_axis_event(0, 3, axis_3)
end

function center(axis)
   if axis ~= 0 then
      axis = axis - (axis / 2)
   end
   return axis
end

--[[
TODO: Some timer or async to center an axis if there's not keypress
while true
do
   axis_0 = center(axis_0)
   axis_1 = center(axis_1)
   axis_2 = center(axis_2)
   axis_3 = center(axis_3)
   axis_4 = center(axis_4)
   axis_5 = center(axis_5)
end
]]--
