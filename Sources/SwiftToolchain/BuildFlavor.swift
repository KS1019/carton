// Copyright 2020 Carton contributors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

public enum SanitizeVariant: String, CaseIterable {
  case stackOverflow
}

/// The target environment to build for.
/// `Environment` doesn't specify the concrete environment, but the type of environments enough for build planning.
public enum Environment: String, CaseIterable {
  public static var allCasesNames: [String] { Environment.allCases.map { $0.rawValue } }

  // TODO: Rename to `commandLine` to avoid confusion
  case wasmer
  case node
  case defaultBrowser

}

public struct BuildFlavor {
  public var isRelease: Bool
  public var environment: Environment
  public var sanitize: SanitizeVariant?
  public var swiftCompilerFlags: [String]

  public init(
    isRelease: Bool,
    environment: Environment,
    sanitize: SanitizeVariant?,
    swiftCompilerFlags: [String]
  ) {
    self.isRelease = isRelease
    self.environment = environment
    self.sanitize = sanitize
    self.swiftCompilerFlags = swiftCompilerFlags
  }
}
