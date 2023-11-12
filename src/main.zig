const std = @import("std");
const rs = @import("./randomstring.zig");

pub fn main() !void {
    // Allocate a fixed-size buffer on the stack to be used as the initial memory for the allocator.
    var buf: [1024]u8 = undefined;
    var fba = std.heap.FixedBufferAllocator.init(&buf);
    var allocator = fba.allocator();
    defer allocator.free(&buf);

    var str = try rs.randomString(16, allocator);
    std.debug.print("{s}\n", .{str});
}
