local n25 = 3238
local n26 = 1420
local flag2 = true
local flag3 = true
do
do
do
do
do
do
do
do

								do
									local v87

									do
										if _G.AZER then
											return
										end
										_G.AZER = true

										cloneref = cloneref or function(arg)
											local v88 = 8192
											if true then
												return arg
											end

											while true do
											end
										end

									do
										local v88 = cloneref
										new = Instance.new
										tweenInfo = TweenInfo.new
										udim = UDim.new
										udim2 = UDim2.new
										udim22 = UDim2.fromOffset
										vector2 = Vector2.new
										vector = Vector3.new
										cframe = CFrame.new
										color = Color3.fromRGB
										format = string.format
										clamp = math.clamp
										floor2 = math.floor
										max = math.max
										min = math.min
										asin = math.asin
										rad = math.rad
										random2 = math.random
										bxor = bit32.bxor
										clear = table.clear
										concat = table.concat
										create = table.create
										find = table.find
										insert = table.insert
										byte = string.byte
										char2 = string.char
										spawn_ = task.spawn
										delay = task.delay
										defer = task.defer
										wait_ = task.wait
										v74 = pcall
										v75 = tostring
										v76 = type
										v77 = unpack
										v78 = tick
										genv = getgenv()
										v79 = v88(game:GetService("ReplicatedStorage"))
										v80 = v88(game:GetService("UserInputService"))
										v87 = v88(game:GetService("HttpService"))
										local v89 = v88(game:GetService("RunService"))
										v81 = v88(game:GetService("TweenService"))
										v82 = v88(game:GetService("Players"))
										v83 = v88(game:GetService("Debris"))
										local v90 = v88(game:GetService("Stats"))
										v84 = v88(game:GetService("Workspace"))
										create2 = v81.Create

										repeat
											wait_()
										until game:IsLoaded()

										localPlayer = v82.LocalPlayer
										name = localPlayer.Name
										currentCamera = v84.CurrentCamera

										v84:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
											currentCamera = v84.CurrentCamera
										end)

										remotes = v79:WaitForChild("Remotes", 10)
										packages = v79.Packages
										controllers = v79.Controllers
										balls = v84.Balls
										alive = v84.Alive
										runtime = v84.Runtime
										dataPing = v90.Network.ServerStatsItem["Data Ping"]
										heartbeat = v89.Heartbeat
										preSimulation = v89.PreSimulation
										postSimulation = v89.PostSimulation
									end
								end

								tbl18 = {
									parry_connections = {},
									fire_sword_connections = {},
									play_parry = nil,
									sword_fn = nil,
								}

								if remotes and v76(getconnections) == "function" then
									do
										local parrySuccessAll = remotes:WaitForChild("ParrySuccessAll", 10)

										if parrySuccessAll then
											local v88, v89 = v74(getconnections, parrySuccessAll.OnClientEvent)

											if v88 and v76(v89) == "table" then
												for _, v90 in v89, nil, nil do
													do
														local v91, v92 = v74(function()
															return v90.Function
														end)

														if v91 and v76(v92) == "function" then
															insert(tbl18.parry_connections, v90)
															tbl18.play_parry = v92
														end
													end
												end
											end
										end
									end

									local v88 = remotes:WaitForChild("FireSwordInfo", 10)

									if v88 then
										local v89, v90 = v74(getconnections, v88.OnClientEvent)

										if v89 and v76(v90) == "table" then
											for _, v91 in v90, nil, nil do
												local v92, v93 = v74(function()
													return v91.Function
												end)

												if v92 and v76(v93) == "function" then
													insert(tbl18.fire_sword_connections, v91)
													tbl18.sword_fn = v93
												end
											end
										end
									end
								end

								tbl19 = { folder = "AZER" }
								tbl19.storage_ok = v76(readfile) == "function" and v76(writefile) == "function"
								tbl19.last_saved = {}
								tbl19.has_saved = false

								tbl19.defaults = {
									accuracy = 100,
									spam_threshold = 3,
									curve_keybind = false,
									manual_notify = false,
									curve_notify = false,
									curve_method = "camera",
									manual_spam = "E",
									mobile_triggerbot_button = false,
									mobile_manual_spam_button = false,
									ability_esp = false,
									auto_parry = false,
									ball_debug = false,
									auto_spam = false,
									random_target = false,
									unlock_all = false,
									last_equipped_sword = "",
									last_equipped_explosion = "",
									favorite_swords = {},
									favorite_explosions = {},
									deleted_swords = {},
									deleted_explosions = {},
									fflag_profile = "default",
									fflag_json = "",
									fflag_auto_load = false,
								}

								tbl19.path = tbl19.folder .. "/config.json"
								tbl19.fflag_folder = tbl19.folder .. "/fflags"

								tbl19.trim = function(arg)
									return v75(arg or ""):match("^%s*(.-)%s*$")
								end

								tbl19.ensure_folder = function()
									local v88 = "function"
									if v76(makefolder) ~= v88 then
										return
									end
									local v89 = "function"
									local flag14 = false

									if v76(isfolder) == v89 then
										local v90
										v90, flag14 = v74(isfolder, tbl19.folder)
										flag14 = v90 and flag14
									end

									if not flag14 then
										v74(makefolder, tbl19.folder)
									end
								end

								tbl19.ensure_fflag_folder = function()
									tbl19.ensure_folder()
									if v76(makefolder) ~= "function" then
										return
									end
									local v88 = "function"
									local flag14 = false

									if v76(isfolder) == v88 then
										local v89
										v89, flag14 = v74(isfolder, tbl19.fflag_folder)
										flag14 = v89 and flag14
									end

									if not flag14 then
										v74(makefolder, tbl19.fflag_folder)
									end
								end

								tbl19.copy = function(arg)
									local v88 = "table"
									if v76(arg) ~= v88 then
										return arg
									end
									local tbl23 = {}

									for k, v89 in arg, nil, nil do
										tbl23[k] = tbl19.copy(v89)
									end

									return tbl23
								end

								tbl19.equal = function(arg, arg2)
									if arg == arg2 then
										return true
									end
									local v88 = "table"
									if v76(arg) ~= v88 or v76(arg2) ~= "table" then
										return false
									end

									for k, v89 in arg, nil, nil do
										local v90 = "table"

										if v76(v89) == v90 then
											if not tbl19.equal(v89, arg2[k]) then
												return false
											end
											continue
										end

										if arg2[k] ~= v89 then
											return false
										end
									end

									for k in arg2, nil, nil do
										if arg[k] == nil then
											return false
										end
									end

									return true
								end

								tbl19.valid_key = function(arg)
									if v76(arg) ~= "string" then
										return false
									end

									local v88, v89 = v74(function()
										return Enum.KeyCode[arg]
									end)

									return v88 and v89 ~= nil
								end

								tbl20 = { "camera", "dot", "backwards", "slow", "random" }

								tbl19.normalize = function(arg)
									local tbl23 = {}

									for k, v88 in tbl19.defaults, nil, nil do
										local flag14 = v76(arg) == "table" and arg[k] or nil
										local v89 = "table"

										if v76(v88) == v89 then
											tbl23[k] = v76(flag14) == "table" and tbl19.copy(flag14) or tbl19.copy(v88)
										else
											tbl23[k] = v76(flag14) == v76(v88) and flag14 or v88
										end
									end

									tbl23.accuracy = clamp(floor2(tbl23.accuracy + 0.5), 1, 100)
									tbl23.spam_threshold = clamp(floor2(tbl23.spam_threshold + 0.5), 1, 3)

									if not find(tbl20, tbl23.curve_method) then
										tbl23.curve_method = tbl19.defaults.curve_method
									end

									if not tbl19.valid_key(tbl23.manual_spam) then
										tbl23.manual_spam = tbl19.defaults.manual_spam
									end

									tbl23.fflag_profile = tbl19.trim(tbl23.fflag_profile)

									if tbl23.fflag_profile == "" then
										tbl23.fflag_profile = tbl19.defaults.fflag_profile
									end

									return tbl23
								end

								do
									local data = nil

									if tbl19.storage_ok then
										tbl19.ensure_folder()

										v74(function()
											data = v87:JSONDecode(readfile(tbl19.path))
										end)
									end

									_G.config = tbl19.normalize(data)
								end

								config = _G.config

								tbl19.changed = function()
									if not tbl19.has_saved then
										return true
									end

									for k in tbl19.defaults, nil, nil do
										local v88 = tbl19.last_saved[k]
										local v89 = config[k]

										if v76(v88) == "table" or v76(v89) == "table" then
											if not tbl19.equal(v88, v89) then
												return true
											end
											continue
										end

										if v88 ~= v89 then
											return true
										end
									end

									return false
								end

								tbl19.save = function()
									if not (not tbl19.storage_ok or not tbl19.changed()) then
										local tbl23 = {}

										for k, v88 in tbl19.defaults, nil, nil do
											local v89 = config[k]

											if v76(v88) == "table" then
												tbl23[k] = v76(v89) == "table" and tbl19.copy(v89) or tbl19.copy(v88)
											else
												tbl23[k] = v76(v89) == v76(v88) and v89 or v88
											end
										end

										local v88, v89 = v74(function()
											return v87:JSONEncode(tbl23)
										end)

										if not v88 then
											return
										end
										tbl19.ensure_folder()
										if not v74(writefile, tbl19.path, v89) then
											return
										end

										for k in tbl19.defaults, nil, nil do
											local v90 = tbl23[k]
											tbl19.last_saved[k] = v76(v90) == "table" and tbl19.copy(v90) or v90
										end

										tbl19.has_saved = true
										return
									end

									if not (n25 <= 3227) then
										return
									end

									while true do
									end
								end

								tbl10 = {
									dropdown = nil,
									path = function(arg)
										local v88 = tbl19.trim(arg)
										if v88 == "" then
											return nil, "profile name is empty"
										end
										local str7 = v88:gsub("[<>:\"/\\|%?%*%c]", "_"):sub(1, 64)
										return tbl19.fflag_folder .. "/" .. str7 .. ".json", nil, str7
									end,
									decode = function(arg)
										if v76(arg) ~= "string" or tbl19.trim(arg) == "" then
											return nil, "fflags json is empty"
										end

										local v88, v89 = v74(function()
											return v87:JSONDecode(arg)
										end)

										if not v88 or v76(v89) ~= "table" then
											return nil, "invalid fflags json"
										end
										local tbl23 = {}
										local v90 = 0

										for k, v91 in v89, nil, nil do
											local v92 = "string"
											if v76(k) ~= v92 or tbl19.trim(k) == "" then
												return nil, "every fflag needs a valid string name"
											end
											local v93 = "string"
											if v76(v91) ~= v93 and v76(v91) ~= "number" and v76(v91) ~= "boolean" then
												return nil, "fflag values must be strings, numbers, or booleans"
											end
											tbl23[k] = v75(v91)
											v90 += 1
										end

										if v90 == 0 then
											return nil, "fflags json has no flags"
										end
										return tbl23, nil, v90
									end,
									apply = function(arg)
										if v76(setfflag) ~= "function" then
											return false, "setfflag is unavailable in this executor"
										end
										local v88, v89, v90 = tbl10.decode(arg)
										if not v88 then
											return false, v89
										end
										local tbl23 = {}

										for k, v91 in v88, nil, nil do
											if not v74(setfflag, k, v91) then
												insert(tbl23, k)
											end
										end

										if #tbl23 > 0 then
											table.sort(tbl23)
											return false, format("failed to apply %d/%d fflags: %s", #tbl23, v90, concat(tbl23, ", "))
										end
										return true, format("applied %d fflags", v90)
									end,
									save_profile = function(arg, arg2)
										if not tbl19.storage_ok then
											return false, "file storage is unavailable"
										end
										local v88, v89 = tbl10.decode(arg2)

										if not v88 then
											if true then
												return false, v89
											end

											while true do
											end
										end

										local v90, v91, v92 = tbl10.path(arg)
										if not v90 then
											return false, v91
										end

										local v93, v94 = v74(function()
											return v87:JSONEncode(v88)
										end)

										if not v93 then
											return false, "could not encode the fflags profile"
										end
										tbl19.ensure_fflag_folder()
										if not v74(writefile, v90, v94) then
											return false, "could not save the fflags profile"
										end
										return true, v94, v92
									end,
									load_profile = function(arg)
										if not tbl19.storage_ok then
											return false, "file storage is unavailable"
										end
										local v88, v89 = tbl10.path(arg)
										if not v88 then
											return false, v89
										end
										local v90, v91 = v74(readfile, v88)
										if not v90 or v76(v91) ~= "string" then
											return false, "fflags profile was not found"
										end
										local v92, v93 = tbl10.decode(v91)
										if not v92 then
											return false, v93
										end
										return true, v91
									end,
									list = function()
										local v88 = "function"
										if v76(listfiles) ~= v88 then
											return nil, "listfiles is unavailable in this executor"
										end
										tbl19.ensure_fflag_folder()
										local v89, v90 = v74(listfiles, tbl19.fflag_folder)
										if not v89 or v76(v90) ~= "table" then
											return nil, "could not list the fflags profiles"
										end
										local tbl23 = {}
										local tbl24 = {}

										for _, v91 in v90, nil, nil do
											local match = v75(v91):gsub("\\", "/"):match("([^/]+)%.json$")

											if match and not tbl24[match] then
												tbl24[match] = true
												insert(tbl23, match)
											end
										end

										table.sort(tbl23, function(arg, arg2)
											return arg:lower() < arg2:lower()
										end)

										return tbl23
									end,
									delete = function(arg)
										if v76(delfile) ~= "function" then
											return false, "delfile is unavailable in this executor"
										end
										local v88, v89 = tbl10.path(arg)
										if not v88 then
											return false, v89
										end

										if not v74(delfile, v88) then
											return false, "could not delete the fflags profile"
										end
										return true
									end,
								}
							end
							
							if config.fflag_auto_load then
								local v87

								do
									local fflagJson = config.fflag_json
									local v88
									v88, v87 = tbl10.load_profile(config.fflag_profile)

									if v88 then
										config.fflag_json = v87
									else
										v87 = fflagJson
									end
								end

								local v88, v89 = tbl10.apply(v87)
								tbl22 = { ok = v88, message = v89 }
							end

							 tbl19.save()

							 spawn_(function()
								while _G.AZER do
									wait_(1)
									tbl19.save()
								end
							end)

							lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/riqegopeek/NeverLose/refs/heads/main/src/interface.luau"))()
							lib:Theme("dark")

							do
								local oxy = lib:AddWindow("AZER", "AZER")
								local combat = oxy:AddTab("combat", "rbxassetid://10734951847")
								local visual2 = oxy:AddTab("visual", "rbxassetid://10723346959")
								local misc2 = oxy:AddTab("misc", "rbxassetid://10709797985")
								v86 = oxy:AddTab("fflags", "rbxassetid://10723364435")
								v85 = combat:AddSection("parry", "left")
								curve = combat:AddSection("curve", "right")
								spam = combat:AddSection("spam", "left")
								hotkeys = combat:AddSection("hotkeys", "right")
								visual = visual2:AddSection("visual", "left")
								misc = misc2:AddSection("misc", "left")
							end
						end

						local profile, v87, v88, v89

					do
						do
							profile = v86:AddSection("profile", "left")
							v87 = v86:AddSection("fflags json", "right")

							do
								local v90 = lib:Notification()

								tbl21 = { notify = function(arg, arg2)
									v90:Notify("info", arg2.title, arg2.content, arg2.duration)
								end }
							end
						end

						fn26 = function(arg, arg2)
							local v90 = new(arg)

							for k, v91 in arg2, nil, nil do
								if k ~= "Parent" then
									v90[k] = v91
								end
							end

							v90.Parent = arg2.Parent
							return v90
						end

						do
							local function fn27(arg)
								for _, v90 in arg, nil, nil do
									if v76(v90) == "function" then
										local v91, v92 = v74(debug.getupvalues, v90)

										if v91 then
											for _, v93 in v92, nil, nil do
												if typeof(v93) == "Instance" and v93:IsA("Frame") and v93.Name == "Section" then
													return v93
												end
											end
										end
									end
								end

								return nil
							end

							local function fn28(arg, arg2, arg3, arg4, arg5, arg6)
								local v90 = fn27(arg)
								assert(v90, "could not resolve the section frame for an input")
								local n31 = arg5 and 142 or 52
								local n32 = arg5 and 120 or 30

								local Frame = fn26("Frame", {
									Name = "Input",
									BackgroundTransparency = 1,
									BorderSizePixel = 0,
									Size = udim2(0.9, 0, 0, n31),
									ZIndex = 5,
									Parent = v90,
								})

								fn26("TextLabel", {
									Name = "LabelText",
									BackgroundTransparency = 1,
									BorderSizePixel = 0,
									Size = udim2(1, 0, 0, 17),
									ZIndex = 6,
									Font = Enum.Font.SourceSansSemibold,
									Text = arg2,
									TextColor3 = color(255, 255, 255),
									TextSize = 14,
									TextTransparency = 0.3,
									TextXAlignment = Enum.TextXAlignment.Left,
									Parent = Frame,
								})

								local v91 = fn26("TextBox", {
									Name = "TextBox",
									BackgroundColor3 = color(13, 13, 13),
									BorderSizePixel = 0,
									Position = udim2(0, 0, 0, 21),
									Size = udim2(1, 0, 0, n32),
									ZIndex = 6,
									ClearTextOnFocus = false,
									Font = Enum.Font.Code,
									MultiLine = arg5,
									PlaceholderColor3 = color(130, 130, 130),
									PlaceholderText = arg3,
									Text = v75(arg4 or ""),
									TextColor3 = color(255, 255, 255),
									TextSize = arg5 and 12 or 14,
									TextTransparency = 0.1,
									TextWrapped = arg5,
									TextXAlignment = Enum.TextXAlignment.Left,
									TextYAlignment = arg5 and Enum.TextYAlignment.Top or Enum.TextYAlignment.Center,
									Parent = Frame,
								})

								local UIPadding = fn26("UIPadding", { Parent = v91 })
								UIPadding.PaddingLeft = udim(0, 8)
								UIPadding.PaddingRight = udim(0, 8)
								UIPadding.PaddingTop = udim(0, arg5 and 6 or 0)
								UIPadding.PaddingBottom = udim(0, arg5 and 6 or 0)
								fn26("UICorner", { CornerRadius = udim(0, 3), Parent = v91 })

								local UIStroke = fn26("UIStroke", {
									ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
									Color = color(50, 50, 50),
									Thickness = 1,
									Parent = v91,
								})

								v91.Focused:Connect(function()
									create2(v81, UIStroke, tweenInfo(0.15), { Color = color(255, 255, 255) }):Play()
								end)

								v91.FocusLost:Connect(function()
									create2(v81, UIStroke, tweenInfo(0.1), { Color = color(50, 50, 50) }):Play()
									arg6(v91.Text)
								end)

								return {
									get = function()
										return v91.Text
									end,
									set = function(arg7, arg8, arg9)
										v91.Text = v75(arg8 or "")

										if arg9 then
											arg6(v91.Text)
										end
									end,
								}
							end

							tbl10.notify_result = function(arg, arg2)
								tbl21:notify({ title = arg and "fflags" or "fflags error", content = arg2, duration = arg and 4 or 6 })
							end

							tbl10.is_option = function(arg)
								return v76(arg) == "string" and arg ~= "(no saved profiles)" and arg ~= "(profile listing unavailable)"
							end

							tbl10.options = function()
								local v90, v91 = tbl10.list()
								if not v90 then
									return { "(profile listing unavailable)" }, v91
								end

								if #v90 == 0 then
									return { "(no saved profiles)" }
								end
								return v90
							end

							v88 = fn28(profile, "profile name", "default", config.fflag_profile, false, function(arg)
								config.fflag_profile = tbl19.trim(arg)
							end)

							v89 = fn28(v87, "fflags json", "{\"DFIntTaskSchedulerTargetFps\":\"240\"}", config.fflag_json, true, function(fflagJson)
								config.fflag_json = fflagJson
							end)
						end
					end

					do
						tbl10.load_into_editor = function(arg)
							local v90, v91, v92 = tbl10.path(arg)
							if not v92 then
								return false, v91
							end
							local v93, v94 = tbl10.load_profile(v92)
							if not v93 then
								return false, v94
							end
							config.fflag_profile = v92
							config.fflag_json = v94
							v88:set(v92, false)
							v89:set(v94, false)
							tbl19.save()
							return true, v92
						end

						tbl10.refresh_dropdown = function(arg)
							local v90 = tbl10.options()
							tbl10.dropdown:Refresh(v90)
							tbl10.dropdown:Value(find(v90, arg) and arg or v90[1])
						end

						do
							local v90, v91 = tbl10.options()

							tbl10.dropdown = profile:AddDropdown("saved profiles", v90, find(v90, config.fflag_profile) and config.fflag_profile or v90[1], function(arg)
								if not tbl10.is_option(arg) then
									return
								end
								local v92, v93 = tbl10.load_into_editor(arg)

								if not v92 then
									tbl10.notify_result(false, v93)
								end
							end)

							if v91 then
								defer(function()
									tbl10.notify_result(false, v91)
								end)
							end
						end
					end

					profile:AddButton("save profile", function()
						local get = v89.get
						local v90, v91, v92 = tbl10.save_profile(tbl19.trim(v88:get()), get(v89))

						if v90 then
							config.fflag_profile = v92
							config.fflag_json = v91
							v88:set(v92, false)
							v89:set(v91, false)
							tbl19.save()
							tbl10.refresh_dropdown(v92)
							tbl10.notify_result(true, format("saved profile '%s'", v92))
						else
							tbl10.notify_result(false, v91)
						end
					end)

					profile:AddButton("load profile", function()
						local loadIntoEditor = tbl10.load_into_editor
						local v90 = table.pack(tbl19.trim(v88:get()))
						v90.n = 1 + v90.n - 1
						table.move(v90, 1, v90.n, 1, v90)
						local v91, v92 = loadIntoEditor(table.unpack(v90, 1, v90.n))

						if v91 then
							if true then
								tbl10.refresh_dropdown(v92)
								tbl10.notify_result(true, format("loaded profile '%s'", v92))
							else
								while true do
								end
							end
						else
							tbl10.notify_result(false, v92)
						end
					end)

					do
						local v90 = profile:AddToggle("auto load", config.fflag_auto_load, function(fflagAutoLoad)
							config.fflag_auto_load = fflagAutoLoad
							tbl19.save()
						end)

						profile:AddButton("set selected as auto load", function()
							local v91 = tbl10.dropdown:Get()
							if not tbl10.is_option(v91) then
								tbl10.notify_result(false, "select a saved profile first")
								return
							end
							local v92, v93 = tbl10.load_into_editor(v91)
							if not v92 then
								tbl10.notify_result(false, v93)
								return
							end
							v90:Value(true)
							tbl10.notify_result(true, format("auto load set to '%s'", v93))
						end)

						profile:AddButton("delete selected profile", function()
							local v91 = tbl10.dropdown:Get()
							if not tbl10.is_option(v91) then
								tbl10.notify_result(false, "select a saved profile first")
								return
							end
							local v92, v93 = tbl10.delete(v91)
							if not v92 then
								tbl10.notify_result(false, v93)
								return
							end

							if config.fflag_profile == v91 then
								config.fflag_profile = tbl19.defaults.fflag_profile
								config.fflag_json = ""
								v88:set(tbl19.defaults.fflag_profile, false)
								v89:set("", false)
								v90:Value(false)
							end

							tbl10.refresh_dropdown()
							tbl19.save()
							tbl10.notify_result(true, format("deleted profile '%s'", v91))
						end)
					end

					v87:AddLabel("format: {\"FFlagName\":\"value\"}")

					v87:AddButton("apply fflags", function()
						config.fflag_profile = tbl19.trim(v88:get())
						config.fflag_json = v89:get()
						tbl19.save()
						local v90, v91 = tbl10.apply(config.fflag_json)
						tbl10.notify_result(v90, v91)
					end)

					if tbl22 then
						defer(function()
							tbl10.notify_result(tbl22.ok, tbl22.message)
						end)
					end
				end

				local tbl22, tbl23, touchEnabled, keyboardEnabled, gamepadEnabled, tbl24, tbl25, tbl26

				do
					local tbl27, tbl28, tbl29, tbl30, fn27

					do
						local tbl31

						do
							tbl22 = {}
							tbl27 = { current = nil, visited = {} }
							tbl28 = { methods = tbl20, dropdown = nil, syncing = false }

							tbl29 = {
								active = nil,
								cache = {},
								tracks = {},
								api = nil,
								generation = 0,
								last_spam = 0,
								cancel_delay = 0.12,
								cancel_fraction = 0.35,
							}

							tbl30 = { count = 0, first_signal = nil }

							v74(function()
								tbl29.api = require(v79.Shared.SwordAPI)
							end)

							localPlayer.CharacterAdded:Connect(function()
								clear(tbl29.tracks)
								tbl29.active = nil
								tbl29.generation = tbl29.generation + 1
								tbl29.last_spam = 0
							end)

							tbl23 = {
								state = {
									AerodynamicTime = v78(),
									LastWarping = v78(),
									LerpRadians = 0,
									Curving = v78(),
								},
								positions = {},
								replicator = nil,
							}

							fn27 = function(arg, arg2, arg3)
								return arg + (arg2 - arg) * arg3
							end

							tbl31 = { captured = {}, hooked = {}, originals = {}, token_fn = nil }

							for _, v86 in getgc(true) do
								if v76(v86) ~= "function" or not debug.info(v86, "s"):find("PRY", 1, true) then
									continue
								else
									for _, v87 in debug.getupvalues(v86) do
										local v88 = "function"

										if v76(v87) == v88 then
											print("found.")
											tbl31.token_fn = v87
											break
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end
