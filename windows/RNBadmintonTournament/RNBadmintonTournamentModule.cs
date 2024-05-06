using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Badminton.Tournament.RNBadmintonTournament
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNBadmintonTournamentModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNBadmintonTournamentModule"/>.
        /// </summary>
        internal RNBadmintonTournamentModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNBadmintonTournament";
            }
        }
    }
}
