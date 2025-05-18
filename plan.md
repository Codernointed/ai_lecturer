You are the best mobile UI/UX designer in the world, a professional specialized in creating intuitive, engaging, and visually stunning mobile app interfaces. You are known for your ability to blend functionality with aesthetics, ensuring that every design element serves a purpose while delighting users. Your designs are celebrated for their simplicity, accessibility, and ability to guide users seamlessly through complex interactions.

Below is a detailed design for the **Dr. Lecturer** mobile app UI, an AI-powered platform that transforms user-uploaded notes into 5-minute spoken lectures. The app allows users to upload files (e.g., .txt, .pdf) or enter text directly, generate a lecture, and interact with the AI through questions, all wrapped in a welcoming and dynamic interface featuring wavy lines to indicate audio activity.

---

### Detailed UI Design

#### 1. Home Screen
- **Purpose**: Welcomes users and provides quick access to core features.
- **Components**:
  - **Header**: Displays "Dr. Lecturer" in a bold, friendly font (e.g., Poppins) with a tagline below: "Turn your notes into engaging lectures!" in a lighter shade.
  - **Start Button**: A large, rounded button labeled "Start a New Lecture" in white text on a teal background (e.g., #26A69A), centered on the screen for easy tapping.
  - **Past Lectures**: A smaller, secondary button or link below labeled "View Past Lectures" in teal, leading to a list of saved sessions.
  - **Background**: A subtle gradient (white to light teal) with faint wavy lines animating gently in the background to hint at the app’s audio focus.
- **Visual Effects**: The wavy lines use a slow, looping animation (e.g., via Lottie) to create a calming, tutor-like vibe.

#### 2. Notes Input Screen
- **Purpose**: Allows users to input notes for lecture generation.
- **Components**:
  - **Upload Option**: A rectangular button with an upload icon and text "Upload File (.txt, .pdf)" in teal, triggering the device’s file picker.
  - **Text Area**: A clean, bordered text box for direct input, with a placeholder: "Paste or type your notes here..." and a live word count (e.g., "0/500 words").
  - **Generate Button**: A prominent "Generate Lecture" button at the bottom, disabled until text or a file is provided, turning teal when active.
- **Visual Effects**: On file upload or text entry, faint wavy lines pulse briefly around the text area to indicate processing readiness.

#### 3. Lecture Screen
- **Purpose**: Plays the generated lecture and supports interaction.
- **Components**:
  - **Lecture Text**: A scrollable text box showing the current lecture, with the spoken sentence highlighted in teal as the AI reads.
  - **Audio Indicator**: Dynamic wavy lines (e.g., three horizontal waves) animate in teal at the top when the AI speaks, pulsing in sync with the voice.
  - **Microphone Button**: A circular microphone icon at the bottom, tappable to interrupt with "Dr. Lecturer" for questions.
  - **Tooltip**: A small, dismissible hint near the microphone: "Say 'Dr. Lecturer' to ask a question."
- **Visual Effects**: Wavy lines expand and contract smoothly (using Flutter’s `AnimatedContainer` or Lottie) to mimic sound waves, enhancing the interactive feel.

#### 4. Question Mode
- **Purpose**: Handles user questions during the lecture.
- **Components**:
  - **Listening State**: Screen dims slightly, showing "Listening..." in large text with animated wavy lines in teal below it.
  - **Transcribed Question**: Once spoken, the user’s question appears in a speech bubble-style box.
  - **AI Answer**: The AI’s response displays below in a similar bubble, with wavy lines pulsing as it speaks.
  - **Resume Button**: A "Resume Lecture" button appears after the answer, or the lecture auto-resumes after a 2-second delay.
- **Visual Effects**: Wavy lines grow more pronounced during listening and speaking, fading out when idle.

#### 5. Visual Design
- **Color Palette**: 
  - Primary: Teal (#26A69A) for buttons and highlights.
  - Secondary: Soft green (#A5D6A7) for accents.
  - Background: White (#FFFFFF) with light gray (#F5F5F5) for contrast.
- **Typography**: Poppins (bold for headers, regular for body) for a modern, approachable look.
- **Wavy Lines**: Integrated across screens, animated with smooth easing curves to represent audio activity, styled as thin, flowing teal lines.

#### 6. Accessibility
- **Text Size**: A settings menu offers small, medium, and large text options, adjusting dynamically via Flutter’s `TextScaler`.
- **High-Contrast Mode**: Toggleable in settings, switching to black backgrounds with white text and brighter teal accents.
- **Tappable Areas**: Buttons and icons are at least 48x48dp for easy tapping, with voice command support via Whisper integration.

---

### Tools and Technologies
- **Framework**: Flutter for cross-platform development (iOS and Android), leveraging its rich widget library and animation capabilities.
- **Animations**: 
  - Use Lottie for wavy line animations, imported via the `lottie` package in Flutter.
  - Alternatively,  for custom wave animations synced with audio playback.




### Enhancing the Experience
- **Welcome Vibe**: The gradient background and animated wavy lines create a soothing, tutor-like atmosphere from the start.
- **Interactivity**: Wavy lines tied to audio states (speaking/listening) make the app feel alive and responsive.
- **Support**: Tooltips and clear button labels guide users intuitively, ensuring they feel supported throughout their learning journey.

This is my idea, for ideation, i learnt that Livekit can do this ai lecturer thing:
Skip to content
Navigation Menu
livekit
agents

Type / to search
Code
Issues
232
Pull requests
89
Actions
Security
Insights
Owner avatar
agents
Public
livekit/agents
Go to file
t
Name		
longcw
longcw
fix readme example links (#2319)
7e01005
 · 
8 hours ago
.github
openai: pass tool choice to session initialization (#2316)
yesterday
examples
update text-only example to show generate_reply usage (#2317)
yesterday
livekit-agents
livekit-agents v1.0.22 (#2320)
10 hours ago
livekit-plugins
livekit-agents v1.0.22 (#2320)
10 hours ago
tests
support simple word and sentence split for character-based language (#…
5 days ago
.gitignore
Add missing agents submodule docs, improve package readmes and docstr…
2 weeks ago
CODE_OF_CONDUCT.md
add CONTRIBUTING.md and CODE_OF_CONDUCT.md (#1120)
6 months ago
CONTRIBUTING.md
add CONTRIBUTING.md and CODE_OF_CONDUCT.md (#1120)
6 months ago
LICENSE
Initial commit
2 years ago
NOTICE
Add NOTICE
last year
README.md
fix readme example links (#2319)
8 hours ago
pyproject.toml
livekit-agents v1.0.17
3 weeks ago
uv.lock
openai: switch to mp3 encoding by default (#2306)
2 days ago
Repository files navigation
README
Code of conduct
Apache-2.0 license
The LiveKit icon, the name of the repository and some sample code in the background.
PyPI - Version Slack community Twitter Follow Ask DeepWiki for understanding the codebase License


Looking for the JS/TS library? Check out AgentsJS

✨ 1.0 release ✨
This README reflects the 1.0 release. For documentation on the previous 0.x release, see the 0.x branch

What is Agents?
The Agents framework enables you to build voice AI agents that can see, hear, and speak in realtime. It provides a fully open-source platform for creating server-side agentic applications.

Features
Flexible integrations: A comprehensive ecosystem to mix and match the right STT, LLM, TTS, and Realtime API to suit your use case.
Integrated job scheduling: Built-in task scheduling and distribution with dispatch APIs to connect end users to agents.
Extensive WebRTC clients: Build client applications using LiveKit's open-source SDK ecosystem, supporting nearly all major platforms.
Telephony integration: Works seamlessly with LiveKit's telephony stack, allowing your agent to make calls to or receive calls from phones.
Exchange data with clients: Use RPCs and other Data APIs to seamlessly exchange data with clients.
Semantic turn detection: Uses a transformer model to detect when a user is done with their turn, helps to reduce interruptions.
MCP support: Native support for MCP. Integrate tools provided by MCP servers with one loc.
Open-source: Fully open-source, allowing you to run the entire stack on your own servers, including LiveKit server, one of the most widely used WebRTC media servers.
Installation
To install the core Agents library, along with plugins for popular model providers:

pip install "livekit-agents[openai,silero,deepgram,cartesia,turn-detector]~=1.0"
Docs and guides
Documentation on the framework and how to use it can be found here

Core concepts
Agent: An LLM-based application with defined instructions.
AgentSession: A container for agents that manages interactions with end users.
entrypoint: The starting point for an interactive session, similar to a request handler in a web server.
Worker: The main process that coordinates job scheduling and launches agents for user sessions.
Usage
Simple voice agent
from livekit.agents import (
    Agent,
    AgentSession,
    JobContext,
    RunContext,
    WorkerOptions,
    cli,
    function_tool,
)
from livekit.plugins import deepgram, elevenlabs, openai, silero

@function_tool
async def lookup_weather(
    context: RunContext,
    location: str,
):
    """Used to look up weather information."""

    return {"weather": "sunny", "temperature": 70}


async def entrypoint(ctx: JobContext):
    await ctx.connect()

    agent = Agent(
        instructions="You are a friendly voice assistant built by LiveKit.",
        tools=[lookup_weather],
    )
    session = AgentSession(
        vad=silero.VAD.load(),
        # any combination of STT, LLM, TTS, or realtime API can be used
        stt=deepgram.STT(model="nova-3"),
        llm=openai.LLM(model="gpt-4o-mini"),
        tts=elevenlabs.TTS(),
    )

    await session.start(agent=agent, room=ctx.room)
    await session.generate_reply(instructions="greet the user and ask about their day")


if __name__ == "__main__":
    cli.run_app(WorkerOptions(entrypoint_fnc=entrypoint))
You'll need the following environment variables for this example:

DEEPGRAM_API_KEY
OPENAI_API_KEY
Multi-agent handoff
This code snippet is abbreviated. For the full example, see multi_agent.py

...
class IntroAgent(Agent):
    def __init__(self) -> None:
        super().__init__(
            instructions=f"You are a story teller. Your goal is to gather a few pieces of information from the user to make the story personalized and engaging."
            "Ask the user for their name and where they are from"
        )

    async def on_enter(self):
        self.session.generate_reply(instructions="greet the user and gather information")

    @function_tool
    async def information_gathered(
        self,
        context: RunContext,
        name: str,
        location: str,
    ):
        """Called when the user has provided the information needed to make the story personalized and engaging.

        Args:
            name: The name of the user
            location: The location of the user
        """

        context.userdata.name = name
        context.userdata.location = location

        story_agent = StoryAgent(name, location)
        return story_agent, "Let's start the story!"


class StoryAgent(Agent):
    def __init__(self, name: str, location: str) -> None:
        super().__init__(
            instructions=f"You are a storyteller. Use the user's information in order to make the story personalized."
            f"The user's name is {name}, from {location}"
            # override the default model, switching to Realtime API from standard LLMs
            llm=openai.realtime.RealtimeModel(voice="echo"),
            chat_ctx=chat_ctx,
        )

    async def on_enter(self):
        self.session.generate_reply()


async def entrypoint(ctx: JobContext):
    await ctx.connect()

    userdata = StoryData()
    session = AgentSession[StoryData](
        vad=silero.VAD.load(),
        stt=deepgram.STT(model="nova-3"),
        llm=openai.LLM(model="gpt-4o-mini"),
        tts=openai.TTS(voice="echo"),
        userdata=userdata,
    )

    await session.start(
        agent=IntroAgent(),
        room=ctx.room,
    )
...
Examples
🎙️ Starter Agent
A starter agent optimized for voice conversations.

Code

🔄 Multi-user push to talk
Responds to multiple users in the room via push-to-talk.

Code

🎵 Background audio
Background ambient and thinking audio to improve realism.

Code

🛠️ Dynamic tool creation
Creating function tools dynamically.

Code

☎️ Outbound caller
Agent that makes outbound phone calls

Code

📋 Structured output
Using structured output from LLM to guide TTS tone.

Code

🔌 MCP support
Use tools from MCP servers

Code

💬 Text-only agent
Skip voice altogether and use the same code for text-only integrations

Code

🍽️ Restaurant ordering and reservations
Full example of an agent that handles calls for a restaurant.

Code

👁️ Gemini Live vision
Full example (including iOS app) of Gemini Live agent that can see.

Code

Running your agent
Testing in terminal
python myagent.py console
Runs your agent in terminal mode, enabling local audio input and output for testing. This mode doesn't require external servers or dependencies and is useful for quickly validating behavior.

Developing with LiveKit clients
python myagent.py dev
Starts the agent server and enables hot reloading when files change. This mode allows each process to host multiple concurrent agents efficiently.

The agent connects to LiveKit Cloud or your self-hosted server. Set the following environment variables:

LIVEKIT_URL
LIVEKIT_API_KEY
LIVEKIT_API_SECRET
You can connect using any LiveKit client SDK or telephony integration. To get started quickly, try the Agents Playground.

Running for production
python myagent.py start
Runs the agent with production-ready optimizations.

Contributing
The Agents framework is under active development in a rapidly evolving field. We welcome and appreciate contributions of any kind, be it feedback, bugfixes, features, new plugins and tools, or better documentation. You can file issues under this repo, open a PR, or chat with us in LiveKit's Slack community.



LiveKit Ecosystem
LiveKit SDKs	Browser · iOS/macOS/visionOS · Android · Flutter · React Native · Rust · Node.js · Python · Unity · Unity (WebGL)
Server APIs	Node.js · Golang · Ruby · Java/Kotlin · Python · Rust · PHP (community) · .NET (community)
UI Components	React · Android Compose · SwiftUI
Agents Frameworks	Python · Node.js · Playground
Services	LiveKit server · Egress · Ingress · SIP
Resources	Docs · Example apps · Cloud · Self-hosting · CLI
About
A powerful framework for building realtime voice AI agents 🤖🎙️📹

docs.livekit.io/agents
Topics
real-time video ai voice openai agents
Resources
 Readme
License
 Apache-2.0 license
Code of conduct
 Code of conduct
 Activity
 Custom properties
Stars
 6k stars
Watchers
 77 watching
Forks
 868 forks
Report repository
Releases 273
livekit-agents@1.0.22
Latest
10 hours ago
+ 272 releases
Contributors
129
@theomonnom
@keepingitneil
@davidzhao
@longcw
@jayeshp19
@github-actions[bot]
@lukasIO
@nbsp
@martin-purplefish
@bcherry
@dsa
@jeradf
@ChenghaoMou
@jmugicagonz
+ 115 contributors
Deployments
118
main
 neil/plugin-api 2 years ago
neil/shutdown
+ 115 deployments
Languages
Python
94.3%
 
C++
3.3%
 
HTML
0.9%
 
CMake
0.7%
 
C
0.6%
 
Objective-C++
0.2%
Footer
© 2025 GitHub, Inc.
Footer navigation
Terms
Privacy
Security
Status
Docs
Contact
Manage cookies
Do not share my personal information
with the sdk:
Skip to content
Navigation Menu
livekit
client-sdk-flutter

Type / to search
Code
Issues
71
Pull requests
6
Actions
Projects
Wiki
Security
Insights
Owner avatar
client-sdk-flutter
Public
livekit/client-sdk-flutter
Go to file
t
Name		
bcherry
bcherry
Unorder the lossy data channel (#783)
06ceafb
 · 
4 days ago
.github
fix/web-deploy (#719)
2 months ago
android
feat: Add smoothTransition option for AudioVisualizer. (#773)
2 weeks ago
example
fix issue 730. (#732)
2 months ago
ios
release: 2.4.6. (#777)
2 weeks ago
lib
Unorder the lossy data channel (#783)
4 days ago
macos
release: 2.4.6. (#777)
2 weeks ago
scripts
release: 2.3.1+hotfix.1. (#650)
6 months ago
shared_swift
feat: Add smoothTransition option for AudioVisualizer. (#773)
2 weeks ago
test
feat: data stream. (#729)
last month
web
Support for WASM builds (#593)
3 months ago
windows
update Copyright 2023 => 2024. (#452)
last year
.gitignore
feat: Support for capturing audio for chrome tab. (#158)
3 years ago
.metadata
initial commit, with generated protobufs
4 years ago
CHANGELOG.md
release: 2.4.6. (#777)
2 weeks ago
LICENSE
added LICENSE
4 years ago
Makefile
Support for WASM builds (#593)
3 months ago
NOTICE
update Copyright 2023 => 2024. (#452)
last year
README.md
update readme (#697)
4 months ago
analysis_options.yaml
update lints to 4.0.0. (#563)
10 months ago
bootstrap.sh
update Copyright 2023 => 2024. (#452)
last year
dartdoc_options.yaml
update Copyright 2023 => 2024. (#452)
last year
pubspec.lock
release: 2.4.2. (#742)
last month
pubspec.yaml
release: 2.4.6. (#777)
2 weeks ago
Repository files navigation
README
Apache-2.0 license
The LiveKit icon, the name of the repository and some sample code in the background.
pub package

LiveKit Flutter SDK
Use this SDK to add realtime video, audio and data features to your Flutter app. By connecting to LiveKit Cloud or a self-hosted server, you can quickly build applications such as multi-modal AI, live streaming, or video calls with just a few lines of code.

This package is published to pub.dev as livekit_client.

Docs
More Docs and guides are available at https://docs.livekit.io

Supported platforms
LiveKit client SDK for Flutter is designed to work across all platforms supported by Flutter:

Android
iOS
Web
macOS
Windows
Linux
Example app
We built a multi-user conferencing app as an example in the example/ folder. LiveKit is compatible cross-platform: you could join the same room using any of our supported realtime SDKs.

Online demo: https://livekit.github.io/client-sdk-flutter/

Installation
Include this package to your pubspec.yaml

---
dependencies:
  livekit_client: <version>
iOS
Camera and microphone usage need to be declared in your Info.plist file.

<dict>
  ...
  <key>NSCameraUsageDescription</key>
  <string>$(PRODUCT_NAME) uses your camera</string>
  <key>NSMicrophoneUsageDescription</key>
  <string>$(PRODUCT_NAME) uses your microphone</string>
Your application can still run the voice call when it is switched to the background if the background mode is enabled. Select the app target in Xcode, click the Capabilities tab, enable Background Modes, and check Audio, AirPlay, and Picture in Picture.

Your Info.plist should have the following entries.

<dict>
  ...
  <key>UIBackgroundModes</key>
  <array>
    <string>audio</string>
  </array>
Notes
Since xcode 14 no longer supports 32bit builds, and our latest version is based on libwebrtc m104+ the iOS framework no longer supports 32bit builds, we strongly recommend upgrading to flutter 3.3.0+. if you are using flutter 3.0.0 or below, there is a high chance that your flutter app cannot be compiled correctly due to the missing i386 and arm 32bit framework #132 #172.

You can try to modify your {projects_dir}/ios/Podfile to fix this issue.

post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)

    target.build_configurations.each do |config|

      # Workaround for https://github.com/flutter/flutter/issues/64502
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES' # <= this line

    end
  end
end
For iOS, the minimum supported deployment target is 12.1. You will need to add the following to your Podfile.

platform :ios, '12.1'
You may need to delete Podfile.lock and re-run pod install after updating deployment target.

Android
We require a set of permissions that need to be declared in your AppManifest.xml. These are required by Flutter WebRTC, which we depend on.

<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.your.package">
  <uses-feature android:name="android.hardware.camera" />
  <uses-feature android:name="android.hardware.camera.autofocus" />
  <uses-permission android:name="android.permission.CAMERA" />
  <uses-permission android:name="android.permission.RECORD_AUDIO" />
  <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
  <uses-permission android:name="android.permission.CHANGE_NETWORK_STATE" />
  <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
  <uses-permission android:name="android.permission.BLUETOOTH" android:maxSdkVersion="30" />
  <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
  <uses-permission android:name="android.permission.BLUETOOTH_ADMIN" android:maxSdkVersion="30" />
  ...
</manifest>
For using the bluetooth headset correctly on the android device, you need to add permission_handler to your project. And call the following code after launching your app for the first time.

import 'package:permission_handler/permission_handler.dart';

Future<void> _checkPermissions() async {
  var status = await Permission.bluetooth.request();
  if (status.isPermanentlyDenied) {
    print('Bluetooth Permission disabled');
  }
  status = await Permission.bluetoothConnect.request();
  if (status.isPermanentlyDenied) {
    print('Bluetooth Connect Permission disabled');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _checkPermissions();
  runApp(MyApp());
}
Audio Modes
By default, we use the communication audio mode on Android which works best for two-way voice communication.

If your app is media playback oriented and does not need the use of the device's microphone, you can use the media audio mode which will provide better audio quality.

import 'package:flutter_webrtc/flutter_webrtc.dart' as webrtc;

Future<void> _initializeAndroidAudioSettings() async {
  await webrtc.WebRTC.initialize(options: {
    'androidAudioConfiguration': webrtc.AndroidAudioConfiguration.media.toMap()
  });
  webrtc.Helper.setAndroidAudioConfiguration(
      webrtc.AndroidAudioConfiguration.media);
}

void main() async {
  await _initializeAudioSettings();
  runApp(const MyApp());
}
Note: the audio routing will become controlled by the system and cannot be manually changed with functions like Hardware.selectAudioOutput.

Desktop support
In order to enable Flutter desktop development, please follow instructions here.

On Windows VS 2019 is needed (link in flutter docs will download VS 2022).

Usage
Connecting to a room, publish video & audio
final roomOptions = RoomOptions(
  adaptiveStream: true,
  dynacast: true,
  // ... your room options
)

final room = Room();

// you can use `prepareConnection` to speed up connection.
await room.prepareConnection(url, token);

await room.connect(url, token, roomOptions: roomOptions);

try {
  // video will fail when running in ios simulator
  await room.localParticipant.setCameraEnabled(true);
} catch (error) {
  print('Could not publish video, error: $error');
}

await room.localParticipant.setMicrophoneEnabled(true);
Screen sharing
Screen sharing is supported across all platforms. You can enable it with:

room.localParticipant.setScreenShareEnabled(true);
Android
On Android, you will have to use a media projection foreground service.

In our example, we use the flutter_background package to handle this. In the app's AndroidManifest.xml file, declare the service with the appropriate types and permissions as following:

<manifest xmlns:android="http://schemas.android.com/apk/res/android">
  <!-- Required permissions for screen share -->
  <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
  <uses-permission android:name="android.permission.FOREGROUND_SERVICE_MEDIA_PROJECTION" />
  <application>
    ...
    <service
        android:name="de.julianassmann.flutter_background.IsolateHolderService"
        android:enabled="true"
        android:exported="false"
        android:foregroundServiceType="mediaProjection" />
  </application>
</manifest>
Before starting the background service and enabling screen share, you must call Helper.requestCapturePermission() from flutter_webrtc, and only proceed if it returns true. Refer to our example implementation for details.

iOS
On iOS, a broadcast extension is needed in order to capture screen content from other apps. See setup guide for instructions.

Desktop(Windows/macOS)
On dekstop you can use ScreenSelectDialog to select the window or screen you want to share.

try {
  final source = await showDialog<DesktopCapturerSource>(
    context: context,
    builder: (context) => ScreenSelectDialog(),
  );
  if (source == null) {
    print('cancelled screenshare');
    return;
  }
  print('DesktopCapturerSource: ${source.id}');
  var track = await LocalVideoTrack.createScreenShareTrack(
    ScreenShareCaptureOptions(
      sourceId: source.id,
      maxFrameRate: 15.0,
    ),
  );
  await room.localParticipant.publishVideoTrack(track);
} catch (e) {
  print('could not publish screen sharing: $e');
}
End to End Encryption
LiveKit supports end-to-end encryption for audio/video data sent over the network. By default, the native platform can support E2EE without any settings, but for flutter web, you need to use the following steps to create e2ee.worker.dart.js file.

# for example app
dart compile js web/e2ee.worker.dart -o example/web/e2ee.worker.dart.js -m
# for your project
export YOU_PROJECT_DIR=your_project_dir
git clone https://github.com/livekit/client-sdk-flutter.git
cd client-sdk-flutter && flutter pub get
dart compile js web/e2ee.worker.dart -o ${YOU_PROJECT_DIR}/web/e2ee.worker.dart.js -m
Advanced track manipulation
The setCameraEnabled/setMicrophoneEnabled helpers are wrappers around the Track API.

You can also manually create and publish tracks:

var localVideo = await LocalVideoTrack.createCameraTrack();
await room.localParticipant.publishVideoTrack(localVideo);
Rendering video
Each track can be rendered separately with the provided VideoTrackRenderer widget.

VideoTrack? track;

@override
Widget build(BuildContext context) {
  if (track != null) {
    return VideoTrackRenderer(track);
  } else {
    return Container(
      color: Colors.grey,
    );
  }
}
Audio handling
Audio tracks are played automatically as long as you are subscribed to them.

Handling changes
LiveKit client makes it simple to build declarative UI that reacts to state changes. It notifies changes in two ways

ChangeNotifier - generic notification of changes. This is useful when you are building reactive UI and only care about changes that may impact rendering.
EventsListener<Event> - listener pattern to listen to specific events (see events.dart).
This example will show you how to use both to react to room events.

class RoomWidget extends StatefulWidget {
  final Room room;

  RoomWidget(this.room);

  @override
  State<StatefulWidget> createState() {
    return _RoomState();
  }
}

class _RoomState extends State<RoomWidget> {
  late final EventsListener<RoomEvent> _listener = widget.room.createListener();

  @override
  void initState() {
    super.initState();
    // used for generic change updates
    widget.room.addListener(_onChange);

    // used for specific events
    _listener
      ..on<RoomDisconnectedEvent>((_) {
        // handle disconnect
      })
      ..on<ParticipantConnectedEvent>((e) {
        print("participant joined: ${e.participant.identity}");
      })
  }

  @override
  void dispose() {
    // be sure to dispose listener to stop listening to further updates
    _listener.dispose();
    widget.room.removeListener(_onChange);
    super.dispose();
  }

  void _onChange() {
    // perform computations and then call setState
    // setState will trigger a build
    setState(() {
      // your updates here
    });
  }

  @override
  Widget build(BuildContext context) {
    // your build function
  }
}
Similarly, you could do the same when rendering participants. Reacting to changes makes it possible to handle tracks published/unpublished or re-ordering participants in your UI.

class VideoView extends StatefulWidget {
  final Participant participant;

  VideoView(this.participant);

  @override
  State<StatefulWidget> createState() {
    return _VideoViewState();
  }
}

class _VideoViewState extends State<VideoView> {
  TrackPublication? videoPub;

  @override
  void initState() {
    super.initState();
    widget.participant.addListener(this._onParticipantChanged);
    // trigger initial change
    _onParticipantChanged();
  }

  @override
  void dispose() {
    widget.participant.removeListener(this._onParticipantChanged);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant VideoView oldWidget) {
    oldWidget.participant.removeListener(_onParticipantChanged);
    widget.participant.addListener(_onParticipantChanged);
    _onParticipantChanged();
    super.didUpdateWidget(oldWidget);
  }

  void _onParticipantChanged() {
    var subscribedVideos = widget.participant.videoTracks.values.where((pub) {
      return pub.kind == TrackType.VIDEO &&
          !pub.isScreenShare &&
          pub.subscribed;
    });

    setState(() {
      if (subscribedVideos.length > 0) {
        var videoPub = subscribedVideos.first;
        // when muted, show placeholder
        if (!videoPub.muted) {
          this.videoPub = videoPub;
          return;
        }
      }
      this.videoPub = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    var videoPub = this.videoPub;
    if (videoPub != null) {
      return VideoTrackRenderer(videoPub.track as VideoTrack);
    } else {
      return Container(
        color: Colors.grey,
      );
    }
  }
}
Mute, unmute local tracks
On LocalTrackPublications, you could control if the track is muted by setting its muted property. Changing the mute status will generate an onTrackMuted or onTrack Unmuted delegate call for the local participant. Other participant will receive the status change as well.

// mute track
trackPub.muted = true;

// unmute track
trackPub.muted = false;
Subscriber controls
When subscribing to remote tracks, the client has precise control over status of its subscriptions. You could subscribe or unsubscribe to a track, change its quality, or disabling the track temporarily.

These controls are accessible on the RemoteTrackPublication object.

For more info, see Subscribing to tracks.

Getting help / Contributing
Please join us on Slack to get help from our devs / community members. We welcome your contributions(PRs) and details can be discussed there.

License
Apache License 2.0

Thanks
A huge thank you to flutter-webrtc for making it possible to use WebRTC in Flutter.



LiveKit Ecosystem
LiveKit SDKs	Browser · iOS/macOS/visionOS · Android · Flutter · React Native · Rust · Node.js · Python · Unity · Unity (WebGL)
Server APIs	Node.js · Golang · Ruby · Java/Kotlin · Python · Rust · PHP (community) · .NET (community)
UI Components	React · Android Compose · SwiftUI
Agents Frameworks	Python · Node.js · Playground
Services	LiveKit server · Egress · Ingress · SIP
Resources	Docs · Example apps · Cloud · Self-hosting · CLI
About
Flutter Client SDK for LiveKit

docs.livekit.io
Topics
video webrtc flutter conferencing
Resources
 Readme
License
 Apache-2.0 license
 Activity
 Custom properties
Stars
 318 stars
Watchers
 22 watching
Forks
 175 forks
Report repository
Releases 81
v2.4.6
Latest
2 weeks ago
+ 80 releases
Packages
No packages published
Contributors
32
@cloudwebrtc
@hiroshihorie
@davidzhao
@davidliu
@td-famedly
@Ocupe
@ashellunts
@bcherry
@kNoAPP
@jezell
@dsa
@JasCodes
@holzgeist
@alex-bluetrain
+ 18 contributors
Deployments
197
 github-pages 4 days ago
+ 196 deployments
Languages
Dart
90.2%
 
Swift
4.6%
 
C++
1.7%
 
Kotlin
1.6%
 
CMake
1.2%
 
Ruby
0.4%
 
Other
0.3%

Sign in
Help

livekit_client 2.4.6 copy "livekit_client: ^2.4.6" to clipboard
Published 11 days ago • verified publisherlivekit.ioDart 3 compatible
SDKFlutterPlatformAndroidiOSmacOSwebWindows
209
Readme
Changelog
Example
Installing
Versions
Scores
pub package

LiveKit Flutter SDK 
Use this SDK to add realtime video, audio and data features to your Flutter app. By connecting to LiveKit Cloud or a self-hosted server, you can quickly build applications such as multi-modal AI, live streaming, or video calls with just a few lines of code.

This package is published to pub.dev as livekit_client.

Docs 
More Docs and guides are available at https://docs.livekit.io

Supported platforms 
LiveKit client SDK for Flutter is designed to work across all platforms supported by Flutter:

Android
iOS
Web
macOS
Windows
Linux
Example app 
We built a multi-user conferencing app as an example in the example/ folder. LiveKit is compatible cross-platform: you could join the same room using any of our supported realtime SDKs.

Online demo: https://livekit.github.io/client-sdk-flutter/

Installation 
Include this package to your pubspec.yaml

---
dependencies:
  livekit_client: <version>
iOS 
Camera and microphone usage need to be declared in your Info.plist file.

<dict>
  ...
  <key>NSCameraUsageDescription</key>
  <string>$(PRODUCT_NAME) uses your camera</string>
  <key>NSMicrophoneUsageDescription</key>
  <string>$(PRODUCT_NAME) uses your microphone</string>
Your application can still run the voice call when it is switched to the background if the background mode is enabled. Select the app target in Xcode, click the Capabilities tab, enable Background Modes, and check Audio, AirPlay, and Picture in Picture.

Your Info.plist should have the following entries.

<dict>
  ...
  <key>UIBackgroundModes</key>
  <array>
    <string>audio</string>
  </array>
Notes
Since xcode 14 no longer supports 32bit builds, and our latest version is based on libwebrtc m104+ the iOS framework no longer supports 32bit builds, we strongly recommend upgrading to flutter 3.3.0+. if you are using flutter 3.0.0 or below, there is a high chance that your flutter app cannot be compiled correctly due to the missing i386 and arm 32bit framework #132 #172.

You can try to modify your {projects_dir}/ios/Podfile to fix this issue.

post_install do |installer|
  installer.pods_project.targets.each do |target|
    flutter_additional_ios_build_settings(target)

    target.build_configurations.each do |config|

      # Workaround for https://github.com/flutter/flutter/issues/64502
      config.build_settings['ONLY_ACTIVE_ARCH'] = 'YES' # <= this line

    end
  end
end
For iOS, the minimum supported deployment target is 12.1. You will need to add the following to your Podfile.

platform :ios, '12.1'
You may need to delete Podfile.lock and re-run pod install after updating deployment target.

Android 
We require a set of permissions that need to be declared in your AppManifest.xml. These are required by Flutter WebRTC, which we depend on.

<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="com.your.package">
  <uses-feature android:name="android.hardware.camera" />
  <uses-feature android:name="android.hardware.camera.autofocus" />
  <uses-permission android:name="android.permission.CAMERA" />
  <uses-permission android:name="android.permission.RECORD_AUDIO" />
  <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
  <uses-permission android:name="android.permission.CHANGE_NETWORK_STATE" />
  <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
  <uses-permission android:name="android.permission.BLUETOOTH" android:maxSdkVersion="30" />
  <uses-permission android:name="android.permission.BLUETOOTH_CONNECT" />
  <uses-permission android:name="android.permission.BLUETOOTH_ADMIN" android:maxSdkVersion="30" />
  ...
</manifest>
For using the bluetooth headset correctly on the android device, you need to add permission_handler to your project. And call the following code after launching your app for the first time.

import 'package:permission_handler/permission_handler.dart';

Future<void> _checkPermissions() async {
  var status = await Permission.bluetooth.request();
  if (status.isPermanentlyDenied) {
    print('Bluetooth Permission disabled');
  }
  status = await Permission.bluetoothConnect.request();
  if (status.isPermanentlyDenied) {
    print('Bluetooth Connect Permission disabled');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _checkPermissions();
  runApp(MyApp());
}
Audio Modes
By default, we use the communication audio mode on Android which works best for two-way voice communication.

If your app is media playback oriented and does not need the use of the device's microphone, you can use the media audio mode which will provide better audio quality.

import 'package:flutter_webrtc/flutter_webrtc.dart' as webrtc;

Future<void> _initializeAndroidAudioSettings() async {
  await webrtc.WebRTC.initialize(options: {
    'androidAudioConfiguration': webrtc.AndroidAudioConfiguration.media.toMap()
  });
  webrtc.Helper.setAndroidAudioConfiguration(
      webrtc.AndroidAudioConfiguration.media);
}

void main() async {
  await _initializeAudioSettings();
  runApp(const MyApp());
}
Note: the audio routing will become controlled by the system and cannot be manually changed with functions like Hardware.selectAudioOutput.

Desktop support 
In order to enable Flutter desktop development, please follow instructions here.

On Windows VS 2019 is needed (link in flutter docs will download VS 2022).

Usage 
Connecting to a room, publish video & audio 
final roomOptions = RoomOptions(
  adaptiveStream: true,
  dynacast: true,
  // ... your room options
)

final room = Room();

// you can use `prepareConnection` to speed up connection.
await room.prepareConnection(url, token);

await room.connect(url, token, roomOptions: roomOptions);

try {
  // video will fail when running in ios simulator
  await room.localParticipant.setCameraEnabled(true);
} catch (error) {
  print('Could not publish video, error: $error');
}

await room.localParticipant.setMicrophoneEnabled(true);
Screen sharing 
Screen sharing is supported across all platforms. You can enable it with:

room.localParticipant.setScreenShareEnabled(true);
Android
On Android, you will have to use a media projection foreground service.

In our example, we use the flutter_background package to handle this. In the app's AndroidManifest.xml file, declare the service with the appropriate types and permissions as following:

<manifest xmlns:android="http://schemas.android.com/apk/res/android">
  <!-- Required permissions for screen share -->
  <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
  <uses-permission android:name="android.permission.FOREGROUND_SERVICE_MEDIA_PROJECTION" />
  <application>
    ...
    <service
        android:name="de.julianassmann.flutter_background.IsolateHolderService"
        android:enabled="true"
        android:exported="false"
        android:foregroundServiceType="mediaProjection" />
  </application>
</manifest>
Before starting the background service and enabling screen share, you must call Helper.requestCapturePermission() from flutter_webrtc, and only proceed if it returns true. Refer to our example implementation for details.

iOS
On iOS, a broadcast extension is needed in order to capture screen content from other apps. See setup guide for instructions.

Desktop(Windows/macOS)
On dekstop you can use ScreenSelectDialog to select the window or screen you want to share.

try {
  final source = await showDialog<DesktopCapturerSource>(
    context: context,
    builder: (context) => ScreenSelectDialog(),
  );
  if (source == null) {
    print('cancelled screenshare');
    return;
  }
  print('DesktopCapturerSource: ${source.id}');
  var track = await LocalVideoTrack.createScreenShareTrack(
    ScreenShareCaptureOptions(
      sourceId: source.id,
      maxFrameRate: 15.0,
    ),
  );
  await room.localParticipant.publishVideoTrack(track);
} catch (e) {
  print('could not publish screen sharing: $e');
}
End to End Encryption 
LiveKit supports end-to-end encryption for audio/video data sent over the network. By default, the native platform can support E2EE without any settings, but for flutter web, you need to use the following steps to create e2ee.worker.dart.js file.

# for example app
dart compile js web/e2ee.worker.dart -o example/web/e2ee.worker.dart.js -m
# for your project
export YOU_PROJECT_DIR=your_project_dir
git clone https://github.com/livekit/client-sdk-flutter.git
cd client-sdk-flutter && flutter pub get
dart compile js web/e2ee.worker.dart -o ${YOU_PROJECT_DIR}/web/e2ee.worker.dart.js -m
Advanced track manipulation 
The setCameraEnabled/setMicrophoneEnabled helpers are wrappers around the Track API.

You can also manually create and publish tracks:

var localVideo = await LocalVideoTrack.createCameraTrack();
await room.localParticipant.publishVideoTrack(localVideo);
Rendering video 
Each track can be rendered separately with the provided VideoTrackRenderer widget.

VideoTrack? track;

@override
Widget build(BuildContext context) {
  if (track != null) {
    return VideoTrackRenderer(track);
  } else {
    return Container(
      color: Colors.grey,
    );
  }
}
Audio handling 
Audio tracks are played automatically as long as you are subscribed to them.

Handling changes 
LiveKit client makes it simple to build declarative UI that reacts to state changes. It notifies changes in two ways

ChangeNotifier - generic notification of changes. This is useful when you are building reactive UI and only care about changes that may impact rendering.
EventsListener<Event> - listener pattern to listen to specific events (see events.dart).
This example will show you how to use both to react to room events.

class RoomWidget extends StatefulWidget {
  final Room room;

  RoomWidget(this.room);

  @override
  State<StatefulWidget> createState() {
    return _RoomState();
  }
}

class _RoomState extends State<RoomWidget> {
  late final EventsListener<RoomEvent> _listener = widget.room.createListener();

  @override
  void initState() {
    super.initState();
    // used for generic change updates
    widget.room.addListener(_onChange);

    // used for specific events
    _listener
      ..on<RoomDisconnectedEvent>((_) {
        // handle disconnect
      })
      ..on<ParticipantConnectedEvent>((e) {
        print("participant joined: ${e.participant.identity}");
      })
  }

  @override
  void dispose() {
    // be sure to dispose listener to stop listening to further updates
    _listener.dispose();
    widget.room.removeListener(_onChange);
    super.dispose();
  }

  void _onChange() {
    // perform computations and then call setState
    // setState will trigger a build
    setState(() {
      // your updates here
    });
  }

  @override
  Widget build(BuildContext context) {
    // your build function
  }
}
Similarly, you could do the same when rendering participants. Reacting to changes makes it possible to handle tracks published/unpublished or re-ordering participants in your UI.

class VideoView extends StatefulWidget {
  final Participant participant;

  VideoView(this.participant);

  @override
  State<StatefulWidget> createState() {
    return _VideoViewState();
  }
}

class _VideoViewState extends State<VideoView> {
  TrackPublication? videoPub;

  @override
  void initState() {
    super.initState();
    widget.participant.addListener(this._onParticipantChanged);
    // trigger initial change
    _onParticipantChanged();
  }

  @override
  void dispose() {
    widget.participant.removeListener(this._onParticipantChanged);
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant VideoView oldWidget) {
    oldWidget.participant.removeListener(_onParticipantChanged);
    widget.participant.addListener(_onParticipantChanged);
    _onParticipantChanged();
    super.didUpdateWidget(oldWidget);
  }

  void _onParticipantChanged() {
    var subscribedVideos = widget.participant.videoTracks.values.where((pub) {
      return pub.kind == TrackType.VIDEO &&
          !pub.isScreenShare &&
          pub.subscribed;
    });

    setState(() {
      if (subscribedVideos.length > 0) {
        var videoPub = subscribedVideos.first;
        // when muted, show placeholder
        if (!videoPub.muted) {
          this.videoPub = videoPub;
          return;
        }
      }
      this.videoPub = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    var videoPub = this.videoPub;
    if (videoPub != null) {
      return VideoTrackRenderer(videoPub.track as VideoTrack);
    } else {
      return Container(
        color: Colors.grey,
      );
    }
  }
}
Mute, unmute local tracks 
On LocalTrackPublications, you could control if the track is muted by setting its muted property. Changing the mute status will generate an onTrackMuted or onTrack Unmuted delegate call for the local participant. Other participant will receive the status change as well.

// mute track
trackPub.muted = true;

// unmute track
trackPub.muted = false;
Subscriber controls 
When subscribing to remote tracks, the client has precise control over status of its subscriptions. You could subscribe or unsubscribe to a track, change its quality, or disabling the track temporarily.

These controls are accessible on the RemoteTrackPublication object.

For more info, see Subscribing to tracks.

Getting help / Contributing 
Please join us on Slack to get help from our devs / community members. We welcome your contributions(PRs) and details can be discussed there.

License 
Apache License 2.0

Thanks 
A huge thank you to flutter-webrtc for making it possible to use WebRTC in Flutter.



LiveKit Ecosystem
LiveKit SDKs	Browser · iOS/macOS/visionOS · Android · Flutter · React Native · Rust · Node.js · Python · Unity · Unity (WebGL)
Server APIs	Node.js · Golang · Ruby · Java/Kotlin · Python · Rust · PHP (community) · .NET (community)
UI Components	React · Android Compose · SwiftUI
Agents Frameworks	Python · Node.js · Playground
Services	LiveKit server · Egress · Ingress · SIP
Resources	Docs · Example apps · Cloud · Self-hosting · CLI
209
likes
140
points
31.9k
downloads
Publisher
verified publisherlivekit.io

Weekly Downloads
Metadata
Flutter Client SDK for LiveKit. Build real-time video and audio into your apps. Supports iOS, Android, and Web.

Repository (GitHub)

Topics
#webrtc #voip #video #livestream #conference

Documentation
API reference

License
Apache-2.0 (license)

Dependencies
async, collection, connectivity_plus, dart_webrtc, device_info_plus, fixnum, flutter, flutter_web_plugins, flutter_webrtc, http, logging, meta, mime_type, path, protobuf, sdp_transform, synchronized, uuid, web

More
Packages that depend on livekit_client

Dart languageReport packagePolicyTermsAPI TermsSecurityPrivacyHelpRSSbug report

Docs

Profile picture of Paul Botchwey
Home
AI Agents
Telephony
Recipes
Reference

Agents framework
v1.0

Python
Getting started
Introduction
Voice AI quickstart
Telephony integration
Web & mobile frontends
Agents playground
Migrating from v0.x
Building voice agents
Overview
Workflows
Agent speech & audio
Vision
Tool definition & use
Pipeline nodes & hooks
Text & transcriptions
Turn detection & interruptions
External data & RAG
Capturing metrics
Events & error handling
Worker lifecycle
Overview
Agent dispatch
Job lifecycle
Worker options
Deployment & operations
Deploying to production
Session recording & transcripts
Partner spotlight
OpenAI
Google
Azure
AWS
Groq
Cerebras
Llama
Integration guides
Overview
Realtime models
Large language models (LLM)
Speech-to-text (STT)
Text-to-speech (TTS)
Virtual avatars
LiveKit Agents
Realtime framework for production-grade multimodal and voice AI agents.

Copy page
Introduction
The Agents framework allows you to add a Python or Node.js program to any LiveKit room as a full realtime participant. The SDK includes a complete set of tools and abstractions that make it easy to feed realtime media and data through an AI pipeline that works with any provider, and to publish realtime results back to the room.

If you want to get your hands on the code right away, follow this quickstart guide. It takes just a few minutes to build your first voice agent.

Voice AI quickstart
Build a simple voice assistant with Python in less than 10 minutes.

GitHub repository
Python source code and examples for the LiveKit Agents SDK.

SDK reference
Python reference docs for the LiveKit Agents SDK.

Use cases
Some applications for agents include:

Multimodal assistant: Talk, text, or screen share with an AI assistant.
Telehealth: Bring AI into realtime telemedicine consultations, with or without humans in the loop.
Call center: Deploy AI to the front lines of customer service with inbound and outbound call support.
Realtime translation: Translate conversations in realtime.
NPCs: Add lifelike NPCs backed by language models instead of static scripts.
Robotics: Put your robot's brain in the cloud, giving it access to the most powerful models.
The following recipes demonstrate some of these use cases:

Medical Office Triage
Agent that triages patients based on symptoms and medical history.
Restaurant Agent
A restaurant front-of-house agent that can take orders, add items to a shared cart, and checkout.
Company Directory
Build a AI company directory agent. The agent can respond to DTMF tones and voice prompts, then redirect callers.
Pipeline Translator
Implement translation in the processing pipeline.
Framework overview
Diagram showing framework overview.
Your agent code operates as a stateful, realtime bridge between powerful AI models and your users. While AI models typically run in data centers with reliable connectivity, users often connect from mobile networks with varying quality.

WebRTC ensures smooth communication between agents and users, even over unstable connections. LiveKit WebRTC is used between the frontend and the agent, while the agent communicates with your backend using HTTP and WebSockets. This setup provides the benefits of WebRTC without its typical complexity.

The agents SDK includes components for handling the core challenges of realtime voice AI, such as streaming audio through an STT-LLM-TTS pipeline, reliable turn detection, handling interruptions, and LLM orchestration. It supports plugins for most major AI providers, with more continually added. The framework is fully open source and supported by an active community.

Other framework features include:

Voice, video, and text: Build agents that can process realtime input and produce output in any modality.
Tool use: Define tools that are compatible with any LLM, and even forward tool calls to your frontend.
Multi-agent handoff: Break down complex workflows into simpler tasks.
Extensive integrations: Integrate with nearly every AI provider there is for LLMs, STT, TTS, and more.
State-of-the-art turn detection: Use the custom turn detection model for lifelike conversation flow.
Made for developers: Build your agents in code, not configuration.
Production ready: Includes built-in worker orchestration, load balancing, and Kubernetes compatibility.
Open source: The framework and entire LiveKit ecosystem are open source under the Apache 2.0 license.
How agents connect to LiveKit
Diagram showing a high-level view of how agents work.
When your agent code starts, it first registers with a LiveKit server (either self hosted or LiveKit Cloud) to run as a "worker" process. The worker waits until it receives a dispatch request. To fulfill this request, the worker boots a "job" subprocess which joins the room. By default, your workers are dispatched to each new room created in your LiveKit project. To learn more about workers, see the Worker lifecycle guide.

After your agent and user join a room, the agent and your frontend app can communicate using LiveKit WebRTC. This enables reliable and fast realtime communication in any network conditions. LiveKit also includes full support for telephony, so the user can join the call from a phone instead of a frontend app.

To learn more about how LiveKit works overall, see the Intro to LiveKit guide.

Getting started
Follow these guides to learn more and get started with LiveKit Agents.

Voice AI quickstart
Build a simple voice assistant with Python in less than 10 minutes.

Recipes
A comprehensive collection of examples, guides, and recipes for LiveKit Agents.

Intro to LiveKit
An overview of the LiveKit ecosystem.

Web and mobile frontends
Put your agent in your pocket with a custom web or mobile app.

Telephony integration
Your agent can place and receive calls with LiveKit's SIP integration.

Building voice agents
Comprehensive documentation to build advanced voice AI apps with LiveKit.

Worker lifecycle
Learn how to manage your agents with workers and jobs.

Deploying to production
Guide to deploying your voice agent in a production environment.

Integration guides
Explore the full list of AI providers available for LiveKit Agents.

On this page

Introduction
Use cases
Framework overview
How agents connect to LiveKit
Getting started
Was this page helpful?



Up Next

Voice AI quickstart




Developers

Documentation
Security
Slack
GitHub
LLMs.txt
Resources

Video Codecs
Codec Bitrates
WebRTC Browser Test
Connection Test
Company

Blog
Careers
About
License
© 2025 LiveKit. All rights reserved.

Terms of Service
|
Cookie Policy
|
Privacy Policy
LiveKit Agents | LiveKit Docs
these are docs from livekit that can be useful for the app, 
