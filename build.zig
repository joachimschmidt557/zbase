const Builder = @import("std").build.Builder;

const executables = [_][]const u8{
    "false",
    "true",
};

pub fn build(b: *Builder) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    inline for (executables) |name| {
        const exe = b.addExecutable(name, name ++ ".zig");
        exe.setTarget(target);
        exe.setBuildMode(mode);
        exe.install();
    }
}
